#!/system/bin/sh

CLOCK_PATH=/system/slptclock/slptclock0

cd ${CLOCK_PATH}

slpt set_view_str ../setting/display/ clocks-to-show date-cn-view\ time-view\ week-cn-view #设置显示日期、时间、星期表盘

slpt set_pic clock/background clockbg.bmp #加载背景图片数据到表盘缓存clock/background中

slpt set_pic clock/day_name day.bmp        #加载指定日期数据到表盘缓存clock/day_name中

slpt set_pic clock/mon_name month.bmp      #加载指定月份数据到表盘缓存clock/mon_name中

slpt set_pic clock/week_name week_zh_CN.bmp #加载指定"周“数据到表盘缓存clock/week_name中

slpt set_pic clock/date_sep date_separator.bmp #加载指定日期分隔符（‘-’）数据到表盘缓存clock/day_sep中

slpt set_pic clock/time_sep time_separator.bmp #加载指定时间分隔符（‘：’）数据到表盘缓存clock/time_sep中

slpt set_pic_grp large_nums/ time/         #将当前目录下的time目录内的0-9数字字号图片数据 加载到large_nums充当大字号数字

slpt set_pic_grp small_nums/ date/         #将当前目录下的date目录内的0-9数字字号图片数据 加载到small_nums充当小字号数字

slpt set_pic_grp week_nums/ week_zh_CN/    #将当前目录下的week_zh_CN目录内的0-7数字图片数据 加载到week_nums中（显示星期几）

slpt init_view date-cn-view date-cn-view/ #初始化数字时钟表盘，使其在显示的时候重新去同步加载新加载进的图片数据

slpt init_view week-cn-view week-cn-view/ #初始化数字时钟表盘，使其在显示的时候重新去同步加载新加载进的图片数据

slpt init_view time-view time-view/ #初始化数字时钟表盘，使其在显示的时候重新去同步加载新加载进的图片数据

# slpt set_view_int low-battery start-x 210 start-y 210 level 100 #设置低电图标显示的位置, level为设置充电图标显示在其他level小于100的view到上层，这里因为其他view到level值均小于100，相当于显示在顶层(这里无低电图标图片）

slpt set_view_int date-cn-view start-x 0x37 start-y 0x92 #设置日期显示的位置

slpt set_view_int week-cn-view start-x 0x8f start-y 0x92 #设置星期显示的位置

slpt set_view_int time-view start-x 0x27 start-y 0x4B #设置时间显示的位置

