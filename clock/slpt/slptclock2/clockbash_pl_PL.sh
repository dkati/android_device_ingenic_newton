#!/system/bin/sh

CLOCK_PATH=`slpt dirname ${0}`

cd ${CLOCK_PATH}

slpt set_view_str ../setting/display/ clocks-to-show analog-clock-viewa\ date-en-view\ week-en-view #设置显示模拟以及日期、时间、星期表盘

slpt set_view_int analog-clock-viewa level 100 #设置表盘上下层关系 ，模拟表盘在上，数字表盘在下

slpt set_view_int date-en-view level 1 #设置表盘上下层关系，模拟表盘在上，数字表盘在下

slpt set_view_int week-en-view level 2 #设置表盘上下层关系，模拟表盘在上，数字表盘在下

# slpt set_pic_grp large_nums/ /system/slptclock/slptclock0/time/         #将当前目录下的time目录内的0-9数字字号图片数据 加载到large_nums充当大字号数字

slpt set_pic_grp small_nums/ /system/slptclock/slptclock0/date/         #将当前目录下的date目录内的0-9数字字号图片数据 加载到small_nums充当小字号数字

slpt set_pic_grp week_nums/ week_pl_PL/    #将当前目录下的week_en_US目录内的0-7数字图片数据 加载到week_nums中（显示星期几）

slpt set_pic clock/background background.bmp #加载背景图片数据到表盘缓存clock/background中

slpt set_pic clock/low-battery-low low-bat-separator.bmp #加载背景图片数据到表盘缓存clock/background中

slpt set_pic clock/date_sep date_separator.bmp #加载指定日期分隔符（‘-’）数据到表盘缓存clock/day_sep中

slpt set_pic clock/hour_hander hour.bmp      #加载时针图片数据到表盘缓存clock/hour_hander中

slpt set_pic clock/minute_hander minute.bmp  #加载分针图片数据到表盘缓存clock/minute_hander中

slpt set_pic clock/second_hander second.bmp  #加载秒针图片数据到表盘缓存clock/second_hander中

slpt init_view analog-clock-view analog-clock-viewa/ #初始化模拟时钟表盘，使其在显示的时候重新去同步加载新加载进的图片数据

slpt init_view date-en-view date-en-view/ #初始化数字时钟表盘，使其在显示的时候重新去同步加载新加载进的图片数据

slpt init_view week-en-view week-en-view/ #初始化数字时钟表盘，使其在显示的时候重新去同步加载新加载进的图片数据

slpt set_view_int low-battery start-x 210 start-y 210 level 100 #设置低电图标显示的位置, level为设置充电图标显示在其他level小于100的view到上层，这里因为其他view到level值均小于100，相当于显示在顶层(这里无低电图标图片）

slpt set_view_int date-en-view center-hor 1 start-y 180 #设置日期显示的位置

slpt set_view_int week-en-view center-hor 1 start-y 155 #设置星期显示的位置

