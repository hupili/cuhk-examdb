# CUHK Exam Database Downloader

Help you to perform batch downloading from CUHK exam database. 

No hacking. No tricks. It's just HTTP request and HTML parsing. 
It helped me to prepare my written qualification exam. 
Can you imagine downloading all papers of all years of 8 courses? 
That's how the scripts come. 

## Usage

   * Fill `account` with your CUHK library account information. 
   * Locate the starting point for crawling. 
   e.g. for the course IERG3090, 
   [this](http://library.cuhk.edu.hk:81/search~S0?/cierg3090/cierg3090/1%2C1%2C2%2CE/frameset&FF=cierg3090&1%2C%2C2)
   is the first page.
   You can search for other course codes.
   Note that due to course code schema change in 2010, 
   you should use old course code to get old exam papers, e.g. IEG3090.
   * Put all the starting points you want in a file, e.g. `url.list.ierg3090`.
   Refer to `url.list.ierg3090` under our directory for a sample.
   * `./run.sh {url_list_file} {output_dir}`. 
   e.g. `./run.sh url.list.ierg3090 ierg3090`.

## Notice

   * Empirically, one account can afford 60 downloads in one day. 
   The strange thing is that after quota is exceeded, 
   not only your access is blocked but also the server is down. 
   If it is not the case now, please tell me. 
   * We download a pdf every 20 seconds. 
   There is no particular reason. 
   If you want to be faster or slower, change `sleep 20 ;` in `down.pl` accordingly. 


