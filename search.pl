#!/usr/bin/perl -w

use strict ;

my $usage = "$0 {fn_url} {dir_output}" ;

my $ARGC = @ARGV ;
($ARGC == 2) or die("$usage\n") ;
my ($fn_url, $dir_output) = @ARGV ;

my @a_url_template = `cat $fn_url` ;
for my $url_template(@a_url_template){
	chomp($url_template) ;

	my $total_count = 0 ;
	if ( $url_template =~ /1%2C%2C(\d+)$/ ){
		$total_count = $1 ;	
		$url_template =~ s/1%2C%2C(\d+)$/<<page>>%2C%2C(\d+)/g ;
	}

	`mkdir -p $dir_output/tmp` ;

	for (my $no = 1 ; $no <= $total_count ; $no ++ ){
		my $url = $url_template ;
		$url =~ s/<<page>>/$no/g ;
		my $md5 = `echo "$url" | md5sum | awk '{print \$1}'` ;
		chomp($md5) ;
		#print "$url\n" ;
		#print "$md5\n" ;
		#last ;
		`wget "$url" -O $dir_output/tmp/$md5` ;
		sleep 1 ;
	}
}

exit 0 ;
