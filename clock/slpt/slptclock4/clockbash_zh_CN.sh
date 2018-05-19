#!/system/bin/sh

CLOCK_PATH=`slpt dirname ${0}`

echo ${CLOCK_PATH}

cd ${CLOCK_PATH}

slpt set_view_str ../setting/display/ clocks-to-show analog-clock-viewa #设置显示模拟时钟表盘

slpt set_pic clock/background background.bmp #加载背景图片数据到表盘缓存clock/background中

slpt set_pic clock/low-battery-low low-bat-separator.bmp #加载背景图片数据到表盘缓存clock/background中

slpt set_pic clock/hour_hander hour.bmp      #加载时针图片数据到表盘缓存clock/hour_hander中

slpt set_pic clock/minute_hander minute.bmp  #加载分针图片数据到表盘缓存clock/minute_hander中

slpt set_pic clock/second_hander second.bmp  #加载秒针图片数据到表盘缓存clock/second_hander中

slpt init_view analog-clock-view analog-clock-viewa/ #初始化模拟时钟表盘，使其在显示的时候重新去同步加载新加载进的图片数据
