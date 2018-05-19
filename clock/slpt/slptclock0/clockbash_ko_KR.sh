#!/system/bin/sh

CLOCK_PATH=/system/slptclock/slptclock0

cd ${CLOCK_PATH}

/system/bin/sh $CLOCK_PATH/clockbash_en_US.sh

slpt set_pic_grp week_nums/ week_ko_KR/    #将当前目录下的week_ko_KR目录内的0-7数字图片数据 加载到week_nums中（显示星期几）

slpt set_view_int week-en-view start-x 0x50 start-y 0x90 #设置日期显示的位置

slpt set_view_int date-en-view start-x 0x80 start-y 0x90 #设置星期显示的位置
