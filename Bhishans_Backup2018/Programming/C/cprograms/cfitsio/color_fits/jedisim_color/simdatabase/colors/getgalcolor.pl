#!/usr/bin/perl
$doproc = 1;

$rsum = 0;
$bsum = 0;

for($i=0;$i<101;$i++) {
    $blue = "f606w_gal".$i.".fits";
    $red = "f814w_gal".$i.".fits";
    chomp($bflux = `imhead -v FLUX < $blue`);
    chomp($rflux = `imhead -v FLUX < $red`);
    $rsum += $rflux;
    $bsum += $bflux;
}

print "$bsum $rsum \n";

sub esystem{
    print "$_[0]\n";
    if ($doproc) {
        system($_[0]);
    }
}
