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

BC_DURATION=( "BC_1MONTH" "BC_2MONTH" "BC_3MONTH" "BC_6MONTH" "BC_1YEAR" "BC_2YEAR" "BC_3YEAR" "BC_5YEAR" "BC_10YEAR" "BC_20YEAR" "BC_30YEAR" )

# Set today's date for matching - use carat to uppercase the date string. 
DATE=$(date +%d-%^b-%y)

# ******************
# TEST DATE 
# DATE="30-JUL-21"

echo "Parsing XML For Posting"
while read_dom; do
    # echo $CONTENT
    if [[ $CONTENT = $DATE ]]; then
        echo "$ENTITY => $CONTENT"
        while read_dom; do
            for i in "${BC_DURATION[@]}"
                do
                    
                    if [[ $ENTITY = $i ]]; then
                        echo "$ENTITY => $CONTENT"
                        #Pass to influxDB posting function
                        post_influx $ENTITY $CONTENT
                    fi
                done
        done
    fi
done < /home/glamke/docker/yieldcurve/web/DailyTreasuryYieldCurveRateData.xml 
