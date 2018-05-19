import common
import struct

# Look, here LOCAL_UBOOT must be similar with dorado/Android.mk LOCAL_UBOOT
LOCAL_UBOOT = 'u-boot-with-spl-mbr-gpt.bin'

def FindRadio(zipfile):
  try:
    return zipfile.read("RADIO/"+LOCAL_UBOOT)
  except KeyError:
    return None


def FullOTA_InstallEnd(info):

  uboot_bin = FindRadio(info.input_zip)
  if uboot_bin:
    WriteRadio(info, uboot_bin)
  else:
    print "no uboot_bin in target_files; skipping install"


def IncrementalOTA_InstallEnd(info):
  tf = FindRadio(info.target_zip)
  if not tf:
    # failed to read TARGET radio image: don't include any radio in update.
    print "no radio.img in target target_files; skipping install"
  else:
    tf = common.File("uboot.bin", tf)

    sf = FindRadio(info.source_zip)
    if not sf:
      # failed to read SOURCE radio image: include the whole target
      # radio image.
      WriteRadio(info, tf.data)
    else:
      sf = common.File("uboot.bin", sf)

      if tf.sha1 == sf.sha1:
        print "u-boot-with-spl-mbr-gpt.bin unchanged; skipping"
      else:
        diff = common.Difference(tf, sf, diff_program="bsdiff")
        common.ComputeDifferences([diff])
        _, _, d = diff.GetPatch()
        if d is None or len(d) > tf.size * common.OPTIONS.patch_threshold:
          # computing difference failed, or difference is nearly as
          # big as the target:  simply send the target.
          WriteRadio(info, tf.data)
        else:
          common.ZipWriteStr(info.output_zip, "u-boot-with-spl-mbr-gpt.bin.p", d)
          info.script.Print("Patching uboot...")
          uboot_type, uboot_device = common.GetTypeAndDevice(
              "/uboot", info.info_dict)

          info.script.PatchCheck("%s:%s:%d:%s:%d:%s" %
                                 (uboot_type, uboot_device,
                                  sf.size, sf.sha1,
                                  tf.size, tf.sha1))

          info.script.ApplyPatch(
              "%s:%s:%d:%s:%d:%s" % (uboot_type, uboot_device,
                                     sf.size, sf.sha1, tf.size, tf.sha1),
              "-", tf.size, tf.sha1, sf.sha1, "u-boot-with-spl-mbr-gpt.bin.p")


def WriteRadio(info, uboot_bin):
  info.script.Print("Writing uboot...")
  common.ZipWriteStr(info.output_zip, LOCAL_UBOOT, uboot_bin)
  _, device = common.GetTypeAndDevice("/uboot", info.info_dict)
  info.script.AppendExtra(
      'package_extract_file("%s", "%s");' % (LOCAL_UBOOT, device,))


