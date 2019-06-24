# columnstore-imdb-data-load
This repo generates the data ready for your MariaDB ColumnStore testing purposes using the IMDB movie data in tsv (tab-separated values)

Check out https://www.imdb.com/interfaces/

This is subject for modification since I have no ownership and do not handle their data from IMDB



## HOW-TO RUN


Script is easy to run. Just make it executable and run this on the master node after you run postConfigure. Just do the following steps:

1.) make it executable
```bash
chmod +x /some/path/imdb-load-data.sh
```
2.) Run the script
```bash
cd /some/path
./imdb-load-data.sh
```
