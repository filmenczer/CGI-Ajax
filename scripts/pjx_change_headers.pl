#! /usr/bin/perl -w

use strict;
use CGI::Ajax;
use CGI;

my $func = sub {
  my $input = shift;
  return "got input: $input " ;
};


sub Show_HTML {
my  $html = <<EOT;

<html>
<head><title>CGI::Ajax Example</title>

</head>
<body>
<form>
Enter Something:&nbsp;
  <input type="text" name="val1" id="val1" size="6" onkeyup="jsfunc( ['val1'], 'result' ); return true;"><br>
Enter Something:&nbsp;
    <hr>
    <div id="result" style="border: 1px solid black;
          width: 440px; height: 80px; overflow: auto">
    </div>

</form>
</body>
</html>

EOT

}

my $cgi = new CGI();  # create a new CGI object
my $pjx = new CGI::Ajax( 'jsfunc' => $func );
# the send in some extra headers;
print $pjx->build_html($cgi,\&Show_HTML, { '-expires' => '1d', '-charset' => 'ISO-8859-1'} );
