#!/usr/bin/perl
use File::Slurp;
$filename = 'login.txt';
open(FILE, $filename) or die "Could not read from $filename, program halting.\n";
while(<FILE>)
{
  chomp;
  @fields = split(':', $_);
  print "Pentru a adauga sau sterge conturi trebuie sa fi logat";
  print "[PASSOWRD][USERNAME] se afiseaza doar ca sa nu mai cautam in login.txt\n";
  print "Am nevoie de [PASSWORD][USERNAME]\n";
  $usrpass = <>;
  print "Deoarece sunt mai multi utilizatori am nevoie de numarul contului tau , default e 0 adauga unu pt fiecare cont in plus\n";
  $number = <>;
  print "$fields\n";
  if ($usrpass = $filename[$number]){
    print  "Bine ai venit\n";
    print  "Esti admin deci poti adauga sau sterge alte conturi\n";
    print  "Alege 1 pt adaugarea unui cont si 2 pt stergere\n";
    $alegere = <>;
    if ($alegere = 1){
      print "Ce username vrei? \n";
      $nousr = <>;
      print "Ce parola vrei? req - 6 caractere minim , o litera mare si macar una mica\n";
      $noupass = <>;

    }elsif ($alegere > 2){
      print "Alege cotul pe care vrei sa il stergi!\n";
      print "$fields";

    }else{
      print "Error";
    }
  }
  else{
    print "Incorect USERNAME sau PASSOWORD\n";
  }
}
close FILE;
