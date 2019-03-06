#!/usr/bin/perl
$doprint = 0;
$doproc = 1;
$fitsfile = shift @ARGV;

open(CF,$fitsfile);
while($cdat = <CF>) {
    chomp($cdat);
    &esystem("ic -h PIXSCALE 0.03 -h MAG0 30 '%1' $cdat > temp.fits");
    &esystem("mv temp.fits $cdat");
}


sub esystem{
    if ($doprint) {
	print "$_[0]\n";
    }
    if ($doproc) {
        system($_[0]);
    }
}
