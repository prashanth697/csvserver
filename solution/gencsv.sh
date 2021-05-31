#!/bin/bash
start=$(date)
for i in {1..10}
  do
    str0=$(($i-1))
    str1=$(od -An -N1 -i /dev/random)
    csv="$csv\n$str0\t$str1"
done
end=$(date)
datediff=$(( $(date -d "$end" +%s) - $(date -d "$start" +%s)))
echo -e $csv > File.csv
cat File.csv | sed -e 's/	/, /g' | sed 1d > inputFile
chmod 777 inputFile
rm File.csv
