#!/bin/bash
# Embellished from https://stackoverflow.com/questions/893585/how-to-parse-xml-in-bash


read_dom () {
    local IFS=\>
    read -d \< ENTITY CONTENT
}

post_influx () {
    echo "Posting..........."
    curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $1=$2"

}


# Set today's date for matching - use carat to uppercase the date string. 
DATE=$(date +%d-%^b-%y)
# echo $DATE
# DATE FORMAT 
# DATE="30-JUL-21"

echo "Parsing XML For Posting"
while read_dom; do
    # echo $CONTENT
    if [[ $CONTENT = $DATE ]]; then
        echo "$ENTITY => $CONTENT"
        while read_dom; do
            if [[ $ENTITY = "BC_1MONTH" ]]; then
                echo "$ENTITY => $CONTENT"
                #Pass to influxDB posting function
                post_influx $ENTITY $CONTENT
            fi
            if [[ $ENTITY = "BC_2MONTH" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_3MONTH" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_6MONTH" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_1YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_2YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_3YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_5YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_7YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_10YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_20YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
            if [[ $ENTITY = "BC_30YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                post_influx $ENTITY $CONTENT            
            fi
        done
    fi
done < /home/glamke/docker/yieldcurve/web/DailyTreasuryYieldCurveRateData.xml 
