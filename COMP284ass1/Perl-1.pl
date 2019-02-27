

#$Zhu = "All work no play makes Jack a dull boy";
#$Zhu = ~ s/no/smart/;
#print "1";
#print "Hello World\n";
#
#
#use POSIX;
#
#print ceil(4.3) , "\n";
#print floor(4.3) , "\n";
#print sqrt(4);
#
#eval {sqrt(-1);} or do {print "fuck u biaatch";}

#print "\"he\Ullo\"", "\n";
#
#print "hello \ world \n";

#use utf8;
#binmode ( STDOUT , " : utf8 " );
#print " \ x {4 f60 }\ x {597 d }\ x {4 e16 }\ x {754 c }\ n " ;

#print "hello " x 3;


#$laoge  = ' ABC ' eq " \ Uabc ";
#print "$laoge" ;

#$s1 = " " ;
#print ' $s1 eq undef:  ' ,( $s1 eq undef ) ? ' TRUE ': ' FALSE ' ," \n " ;
#print ' $s1 defined : ' ,( defined ( $s1 )) ? ' TRUE ': ' FALSE ' ," \n " ;
#print ' $s2 defined : ' ,( defined ( $s2 )) ? ' TRUE ': ' FALSE ' ," \n " ;

# Convert Fahrenheit to Celsius :
# Subtract 32 , then multiply by 5 , then divide by 9
#$temperature = 105; # temperature in Fahrenheit
#( $temperature -= 32) *= 5/9; # converted to Celsius
#print "$temperature";

#use strict ;
#my $studentsOnCOMP284;
#$studentsOnCOMP284 = 133;
#print "1..10";

#@array = (1,undef,2,3);
#print $#array + 1;
#print $array[2];

#% hash = (key1 , value1 , key2 , value2 ,key3, value2);
#delete($hash{key2});
#undef %hash;
#use Data::Dumper ;
#$Data::Dumper::Terse = 1;
#print Dumper \% hash ;


## Establish the frequency of words in a string
# $string = " peter paul mary paul jim mary paul " ;
#
# # Split the string into words and use a hash
## to accumulate the word count for each word
# ++ $count { $_ } foreach split (/\ s+/ , $string );
#
# # Print the frequency of each word found in the
# # string
# while ( ( $key , $value ) = each %count ) {
# print ( " $key = > $value ; " );}
 
 

