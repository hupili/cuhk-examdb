#!/usr/bin/perl 

use strict ;

my $usage = "$0 {fn_list} {dir_output}" ;

my $ARGC = @ARGV ;
($ARGC == 2) or die("$usage\n") ;
my $fn_list = $ARGV[0] ;
my $dir_output = $ARGV[1] ;

`mkdir -p $dir_output/pdf` ;

my $user = `grep user account | awk -F":" '{print \$2}'` ;
chomp($user) ;
my $password = `grep password account | awk -F":" '{print \$2}'` ;
chomp($password) ;

my $account = "--user=$user --password=$password" ;

my @a_list = `cat $fn_list` ;
for (@a_list){
	chomp ;
}
for (my $i = 0 ; $i < scalar @a_list ; $i += 8){
	my $title = $a_list[$i + 1] ;
	my $year = $a_list[$i + 3] ;
	my $url = $a_list[$i + 4] ;
	my $code = $a_list[$i + 5] ;
	my $term = $a_list[$i + 6] ;
	my $filename = "$title-$code-$year-$term" ;
	$filename =~ s/ /-/g ;
	$filename =~ s/\(/-/g ;
	$filename =~ s/\)/-/g ;
	if ( ! -e "$dir_output/pdf/$filename.pdf" ){
		`wget $account "$url" -O $dir_output/pdf/$filename.pdf` ;
		sleep 20 ;
	}
	#last ;
}

exit 0 ;
