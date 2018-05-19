#!/system/bin/sh

CLOCK_PATH=/system/slptclock/slptclock0

cd ${CLOCK_PATH}

/system/bin/sh $CLOCK_PATH/clockbash_zh_CN.sh

slpt set_pic clock/week_name week_zh_TW.bmp #加载指定星期数据到表盘缓存clock/week_name中
