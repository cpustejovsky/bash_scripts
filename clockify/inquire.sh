#!/bin/env bash


now=$(bc -l <<<"$(clockify-cli report -p tech today -F)")
total=$(bc -l <<<"$(clockify-cli report -p tech this-month -F)"-"${now}")
echo $total 0 $now 0
