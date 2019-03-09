sub change {
  my($a) = @_;
  chdir "$a" or die "ERROR: $!";
}
print "Vrei sa : register sau login-in "; chomp($a=<STDIN>);
if($a =~ /register/i) {
  print "Care este numele tau: "; chomp($name=<STDIN>);
  print "Care e parola ta: "; chomp($password=<STDIN>);
  change "name";
  open NAME, ">$name.nme";
  print NAME "$name";
  close NAME;
  change "..";
  change "password";
  open (PASSWORD, "> $name.pswrd");
  print PASSWORD "$password";
  close (PASSWORD);
  change "..";
  print "Gata.\n";
}
else {
  print "Nume: "; chomp($a=<STDIN>);
  print "Parola: "; chomp($b=<STDIN>);
  change "name";
  open (NAME, "$a.nme");
  $c=<NAME>;
  close (NAME);
  change "..";
  change "password";
  open (PASSWORD, "$a.pswrd");


  $d=<PASSWORD>;
  PASSWORD;
  "..";
}
if($a =~ /$c/ and $b =~ /$d/) {
  print "Log-in successful!\n";
  sleep(2);
  print  "Hello, $a!\n";
}
