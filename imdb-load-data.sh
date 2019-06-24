#!/bin/bash

DELIM="|"
MYSQL_PATH=/usr/local/mariadb/columnstore/mysql/bin/mysql
CPIMPORT_PATH=/usr/local/mariadb/columnstore/bin/cpimport

curl https://datasets.imdbws.com/|grep 'tsv.gz'|sed "s|\(<ul><a\shref\=\)\(.*.gz\)\(>.*>\)|\2|g"| xargs wget


## Convert tsv to custom delimited file 
for f in $(ls *.gz| sort -h)
do
   f2=$(echo $f | sed 's/.tsv.gz//g'| sed 's/\./\_/g' )  
   echo "f2 is: ${f2}"
   echo "$(date): Convert file ${f} to custom delimited file"
   zcat $f > "${f2}.dat"
   sed -i '1d; s/\t/|/g' "${f2}.dat"
   unlink $f

done


$MYSQL_PATH --defaults-extra-file=/usr/local/mariadb/columnstore/mysql/my.cnf --show-warnings -vvv < columnar-schema.sql

for f in $(ls *.dat| sort)
do
   t=${f%%.*}
   echo "$(date): Dump data from file ${f} for table imdb.${t}"
   $CPIMPORT_PATH -d 3 -s '|' imdb ${t} ${f}
   echo -e "$(date): Successfully loaded data for table imdb.${t} \n"
done
