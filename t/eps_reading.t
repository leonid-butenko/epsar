use strict;
use Test::More tests => 5;
use File::Basename;
use File::Path;

my $dirname = dirname(__FILE__);
print "dirname ".$dirname."\n";

# 1. nominal reading
print `./epsar -t "$dirname/data/GRAS_xxx_1B_M03_20211112113048Z_20211112114657Z_N_O_20211112132045Z"`;
cmp_ok($?, '==', 0, "1. Nominal reading. Exit code from epsar is not zero: $?");

my $tdir = "$dirname/temp/";

rmtree $tdir;
unless(mkdir $tdir) {
	print "Cannot create directory '$tdir'";
	ok(0)
}

# output dir created
ok( -e $tdir, "Test dir exists");

# 2. extract mdrs and check they are 3
print `./epsar -x -C "$tdir" "$dirname/data/GRAS_xxx_1B_M03_20211112113048Z_20211112114657Z_N_O_20211112132045Z"`;
cmp_ok($?, '==', 0, "2. Extract mdrs. Exit code from epsar is not zero: $?");

my @mdrs = glob "'$tdir/GRAS_1B*.nc'";

cmp_ok(scalar(@mdrs), "==", 3, "2. Extract mdrs. Number of mdrs should be 3, got: " . scalar(@mdrs));

# 3. running epsar with broken product and expect error code
print `./epsar -t "$dirname/data/GRAS_xxx_1B_M03_20211112113048Z_20211112114657Z_N_O_20211112132045Z.incomplete"`;
cmp_ok($?, '>', 0, "3. Broken L1B product. Exit code from epsar is not zero: $?");

rmtree $tdir;
