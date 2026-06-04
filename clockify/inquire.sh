#!/bin/env bash

now=$(bc -l <<<"scale=0;$(clockify-cli report -p tech today -F)*60/1")
echo $now

