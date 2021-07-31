BC_DURATION=( "BC_1MONTH" "BC_2MONTH" "BC_3MONTH" "BC_6MONTH" "BC_1YEAR" "BC_2YEAR" "BC_3YEAR" "BC_5YEAR" "BC_10YEAR" "BC_20YEAR" "BC_30YEAR" )
for i in "${BC_DURATION[@]}"
do
  echo $i
done


array=( one two three )
for i in "${array[@]}"
do
	echo $i
done