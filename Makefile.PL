use 5.008003;
use ExtUtils::MakeMaker;

##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
##
## Author leonid.butenko@eumetsat.int
##
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
##

my $mm = WriteMakefile(
    NAME              => 'EPSar',
    VERSION           => "1.8",
    VERSION_FROM      => 'epsar', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    PREREQ_FATAL      => 1,
    EXE_FILES         => [ 'epsar' ],
    AUTHOR            => 'Leonid Butenko <leonid.butenko@eumetsat.int>',
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '-Dbool=int -DTRUE=1 -DFALSE=0 -DMAXFLOAT=9.99e99', # e.g., '-DHAVE_SOMETHING'
    OPTIMIZE          => '-g',
);
