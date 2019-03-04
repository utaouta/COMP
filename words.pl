#!/usr/bin/perl
#decalaration: all parts of my code do not refer to any sources but lab_sessions and lectures
#import CGI module
use CGI qw(-utf-8 :all *table);
use LWP::Simple qw(get);
# declaratioon of encoding format       
binmode(STDOUT, ":encoding(utf-8)");
print header(-charset=>'utf-8'), "\n",
#Use perl html shortcuts to start a html
start_html({-title=>'COMP284 assignment1 Tiange Xu',
-author=>'Tiange Xu ID:201377012'}), "\n";
#detect if the user has entered url
if (param('URL')) {
    #get the document from the url
    $text = get(param('URL'));
    #print error message if no document is retrieved from the url 
    if(!$text){print "Invalid input, please enter again!";}
else{
    # otherwise display the url
print h1("The URL entered is: ".param('URL')), "\n";
#transfer all characters in the document to lowercase
$text = lc($text);
#make the document verbatim
$text_verbatim = escapeHTML($text);
#display the document including html tags
print h1("Contend of URl is: ");
         print $text_verbatim;
         print br();print br();
#below are document mofification using regular experssions

#substitte all content within <>(<>included) with whitespace
$text_verbatim =~ s/&lt.*?&gt/&nbsp/g;
#substitte all content except a-z 0-9 - _ ' with whitespace
$text_verbatim =~ s/[^a-z0-9-_&#39]/&nbsp/g;
#expand single white space for future capture use 
$text_verbatim =~ s/&nbsp/&nbsp&nbsp/g;
#substitte any continued hyphen with whitespace
$text_verbatim =~ s/--+/&nbsp&nbsp/g;


# following are used to exclude remain html comment as well as <>

$text_verbatim =~ s/&lt.*&lt.*&gt/&nbsp/g;
$text_verbatim =~ s/&lt.*?&gt/&nbsp/g;
#make a whitespace in front of the document (due to my capture experssion) 
$front_space= "&nbsp";
$text_verbatim =$front_space.$text_verbatim;
# set up capture groups(for specific wordformat), and store the results in an array
# this capture group is designed for wordsformat except words ended with s' '(t d ll am etc.)
my @strings =($text_verbatim =~ /&nbsp([a-z]+[-]?[\w]+[^-_])&nbsp/g) ;
#my @strings1 =($text_verbatim)
print $text_verbatim, br();

    

print br();print br();print br();
# this flag is set to decide whether to print the table
$print_table = 1;
# this block is set to print out the totoal number of words and distingui "word" with "words"
$word_count  = scalar(@strings);
if (scalar(@strings)==0){
    print "The document contains 0 word";
    $print_table = 0;
}
if (scalar(@strings)==1){
    print "The document contains 1 word";
    
}
if(scalar(@strings)>1){
    print "The document contains $word_count  words";
}
print br();print br();
#set up a hash to store each key value pair
%count = ();
foreach $string (@strings) {
$count{$string}++;
}

# variable set to control the rows of the table 
$keys_count = scalar keys %count;
# check the print_table flag and decide whether to print the table
if($print_table == 1){

print start_table({-border =>"1" });

print caption("10 Words Occurring Most Often");


print Tr(th("Word"),th("No of occurences"));
if($keys_count>10){
my $i = 0;
#print each key value pair in rows, the same in the other table
foreach $key (sort { $count{$b} <=> $count{$a} } keys %count) {
    if($i<10){
print Tr(td($key), td($count{$key}));
$i++;
}
}
}
else{
    
    foreach $key (sort { $count{$b} <=> $count{$a} } keys %count) {
        print Tr(td($key), td($count{$key}));
    }
}

print end_table;print br();print br();

print start_table({-border =>"1" });
print caption("10 Words Occurring Least Often");

print Tr(th("Word"),th("No of occurences"));
if($keys_count>10){
my $i = 0; 
foreach $key (sort { $count{$a} <=> $count{$b} } keys %count) {
    if($i<10){
print Tr(td($key), td($count{$key}));
$i++;
}
}
}
else{
    
    foreach $key (sort { $count{$b} <=> $count{$a} } keys %count) {
        print Tr(td($key), td($count{$key}));
    }
}
print end_table ;

}
}
}
#pirnt the head to let user enter a url
print h1("Please enter a URL"), "\n";
print start_form({-method=>"POST"});
print label("URL: ");
#make textfield to let use ty the url
print textfield({-name=>'URL',
-size=>200}), "\n";
print br(), "\n";
#set up submit button
print submit({-name=>'submit',
-value=>'Process'}), "\n";
print end_form, end_html;
