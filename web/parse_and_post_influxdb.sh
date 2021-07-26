#!/bin/bash
# Embellished from https://stackoverflow.com/questions/893585/how-to-parse-xml-in-bash


read_dom () {
    local IFS=\>
    read -d \< ENTITY CONTENT
}


# Set today's date for matching
DATE=`date +%d-%b-%Y`
# DATE FORMAT 
# DATE="23-JUL-21"

echo "Parsing XML For Posting"
while read_dom; do
    if [[ $CONTENT = $DATE ]]; then
        echo "$ENTITY => $CONTENT"
        while read_dom; do
            if [[ $ENTITY = "BC_1MONTH" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_2MONTH" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_3MONTH" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_6MONTH" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_1YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_2YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_3YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_5YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_7YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_10YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_20YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
            if [[ $ENTITY = "BC_30YEAR" ]]; then
                echo "$ENTITY => $CONTENT"
                curl -i -XPOST 'http://10.10.10.102:8086/write?db=yieldcurve&precision=s' --data-binary "tag=BC_DATA $ENTITY=$CONTENT"
            fi
        done
    fi
done < DailyTreasuryYieldCurveRateData.xml 

# echo $DATE