#!/usr/bin/env bash

TMP_FILE=/tmp/raw_apogee.csv
OUTF_FILE=apogee.csv

wget 'http://skyserver.sdss.org/dr13/en/tools/search/x_results.aspx?searchtool=SQL&TaskName=Skyserver.Search.SQL&syntax=NoSyntax&ReturnHtml=true&cmd=select+ra%2C+dec+from+apogeeField&format=csv&TableName=' -O $TMP_FILE && \
sed '/^#/d' $TMP_FILE > $OUTF_FILE && \
rm $TMP_FILE
