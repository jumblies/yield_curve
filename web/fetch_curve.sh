#!/bin/bash
#wget "http://data.treasury.gov/feed.svc/DailyTreasuryYieldCurveRateData?$filter=month(NEW_DATE)%20eq%203%20and%20year(NEW_DATE)%20eq%202021" --output-document=DailyTreasuryYieldCurveRateData.xml
wget "https://www.treasury.gov/resource-center/data-chart-center/interest-rates/Datasets/yield.xml" \
--output-document=/home/glamke/docker/yieldcurve/web/DailyTreasuryYieldCurveRateData.xml

source /home/glamke/docker/yieldcurve/web/parse_and_post_influxdb.sh

