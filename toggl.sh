#!/bin/env bash

# grab date for the beginning of the month
start=$(date +%Y-%m-01)
# grab date for the end of the month
end=$(date -d "`date +%Y%m01` +1 month" +%Y-%m-%d)
# get results for the month
results=$(toggl sum -s $start -p $end -st )
# grep for total and today from the results
total=$(echo $results | grep -P "total\s(\d|:)*" -o)
now=$(echo $results | grep -P "today\s(\d|:)*" -o)

# set internal field separator to both ":" and " "
IFS=': '
# create arrays from total and now and assign hour and minutes to variables
totalArr=($total)
totalHr="${totalArr[1]}"
totalMin="${totalArr[2]}"
nowArr=($now)
nowHr="${nowArr[1]}"
nowMin="${nowArr[2]}"
minInHr="60"
# adjust total value by subtracting the present value
adjustedTotal=$(awk '{print ($1*$2+$3)-($4*$2+$5)}' <<<"${totalHr} ${minInHr} ${totalMin} ${nowHr} ${nowMin}")
totalHr=$(awk '{print int($1/$2)}' <<<"${adjustedTotal} ${minInHr}")
totalMin=$(awk '{print int($1%$2)}' <<<"${adjustedTotal} ${minInHr}")
# set now min and hr values to 0 if they are empty because there was no value for today
if [ -z "${nowMin}" ] ; then
    : ${nowMin:="0"}
fi
if [ -z "${nowHr}" ] ; then
    : ${nowHr:="0"}
fi
# echo the values that will be read by toggltrack
echo $totalHr $totalMin $nowHr $nowMin

