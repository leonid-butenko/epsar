use 5.008003;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $mm = WriteMakefile(
    NAME              => 'EPSar',
    VERSION           => "1.0",
    VERSION_FROM      => 'epsar', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    PREREQ_FATAL      => 1,
    EXE_FILES         => [ 'epsar' ],
    AUTHOR            => 'Leonid Butenko <leonid.butenko@eumetsat.int>',
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '-Dbool=int -DTRUE=1 -DFALSE=0 -DMAXFLOAT=9.99e99', # e.g., '-DHAVE_SOMETHING'
    OPTIMIZE          => '-g',
);

