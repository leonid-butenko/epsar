# EPSar v1.7                                  EUMETSAT (c) 2012-2016

EPSar is a tool for wrapping and unwrapping EPS products containing NetCDF and/or BUFR data records.

Author: leonid.butenko@eumetsat.int

## Installation

    perl Makefile.PL [PREFIX=/path/to/install]
    make install

## Usage

    epsar -x -c -v -t [-m [<MPHR>]] [-C <output dir>] <EPS_Product> [<file1>...<fileN>]

       -x, --extract   Unwrap EPS product, e.g:
                          epsar -x <EPS_PRODUCT>
       -c, --create    Create EPS product from a set of product files (NetCDF4/BUFR) and MPHR file. e.g:
                          epsar -c -m <MPHR> <netCDF4/BUFR files to wrap>
       -t, --list      Lists the NetCDF4/BUFR files contained in the EPS product.
       -C, --outdir    Output directory (default is ./)
       -v, --verbose   Verbose output (default is silent)
       -m, --mphr      MPHR file with the product model for -c (when extracting enables MPHR to be stored in a separate file)


## Examples

Listing the contents ofa GRAS EPS product:

    user@linux:~# epsar -t GRAS_xxx_1B_M01_20160405084240Z_20160405085244Z_N_C_20160405095153Z
    MDR 0: GRAS_1B_M01_20160405084240Z_20160405084414Z_N_C_20160405095153Z_G24_NN.nc
    MDR 1: GRAS_1B_M01_20160405084326Z_20160405084616Z_N_C_20160405095153Z_G05_NN.nc
    MDR 2: GRAS_1B_M01_20160405084443Z_20160405084717Z_N_C_20160405095153Z_G09_NN.nc
    MDR 3: GRAS_1B_M01_20160405084831Z_20160405085017Z_N_C_20160405095153Z_G12_NN.nc
    MDR 4: GRAS_1B_M01_20160405084842Z_20160405085244Z_N_C_20160405095153Z_G01_NN.nc
    MDR 5: GRAS_1B_M01_20160405084954Z_20160405085141Z_N_C_20160405095153Z_G30_NN.nc

Extracting all files into the current directory:

    user@linux:~# epsar -x GRAS_xxx_1B_M01_20160405084240Z_20160405085244Z_N_C_20160405095153Z


## What's new in 1.6:

- Handles degraded MDR counters correctly

## What's new in 1.5:

- Skips Dummy MDRs (no warnings produced)
- More robust handling of inconsistencies between filenames and content of MPHR
- Updates MPHR content basing on the MPHR filename while creating EPS Product

## What's new in 1.4:

- Added baseline support for EPS names

## What's new in 1.2:

- Fixed IPR generation for multiple MDRs covering same time periods
