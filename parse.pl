#!/usr/bin/perl -w

use strict ;

my @a_input = <STDIN> ;

#for my $line(@a_input){
for ( my $i = 0 ; $i < scalar @a_input ; $i ++ ){
	#my $line = $_ ;
	my $line = $a_input[$i] ;
	chomp($line) ;
	if ( $line =~ /<strong>(.*)<\/strong>/ ){
		print "$1\n" ;	
		next ;
	}
	if ( $line =~ /Year<\/td>/ ){
		$i += 2 ;
		$line = $a_input[$i] ;
		chomp($line) ;
		$line =~ s/<.*$//g ;
		print "$line\n" ;
		next ;
	}	
	if ( $line =~ /<a href="?(.*?)"?>View Examination Papers/ ){
		print "$1\n" ;	
	}
	if ( $line =~ /Course Code<\/td>/ ){
		$i += 2 ;
		$line = $a_input[$i] ;
		chomp($line) ;
		$line =~ s/<.*$//g ;
		print "$line\n" ;
		next ;
	}	
	if ( $line =~ /Term<\/td>/ ){
		$i += 2 ;
		$line = $a_input[$i] ;
		chomp($line) ;
		$line =~ s/<.*?>//g ;
		print "$line\n" ;
		next ;
	}	
}

exit 0 ;
