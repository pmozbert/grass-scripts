

$infile="C:\gis\data\nj\livingston_tax.psmap"
$epsout="c:\temp\map.eps"
$psout="c:\temp\map.ps"
ps.map -e input=$infile output=$epsout --overwrite
$Env:Path="C:\Program Files\gs\gs9.26\bin;$($Env:Path)"
& "C:\Program Files\gs\gs9.26\lib\ps2pdf.bat" $psout

$infile="C:\gis\data\nj\livingston_taxR.psmap"

C:\>ps.map input=$infile output=$psout --overwrite --verbose

$Env:GRASS_PSFILE='c:\temp\taxmap.ps'
$Env:GRASS_PAPER='A4'
$Env:GRASS_TRUECOLOR='True'
d.mon start=ps --verbose output=$psout --overwrite