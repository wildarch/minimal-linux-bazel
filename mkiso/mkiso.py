"""
mkiso: A simple command-line tool to create bootable iso images. 
    Its input arguments are similar to mkisofs.

    Author: Daan de Graaf
"""
from io import BytesIO
import pycdlib
import argparse
import os

parser = argparse.ArgumentParser(description='Create a bootable iso image')
parser.add_argument('-o', dest='output')
parser.add_argument('-b', dest='boot')
parser.add_argument('-c', dest='boot_cat')
parser.add_argument('files', nargs='+')
args = parser.parse_args()

iso = pycdlib.PyCdlib()
iso.new(interchange_level=3, rock_ridge='1.09')

def char_range(start, end):
    for c in range(ord(start), ord(end)+1):
        yield chr(c)

ISO9660_CHARS = list(char_range('A', 'Z')) + list(char_range('0', '9')) + ['.', '_']

def iso_filename(filename):
    filename = ''.join([ c for c in filename.upper() if c in ISO9660_CHARS ])
    return '/{};1'.format(filename)

for path in args.files:
    filename = os.path.basename(path)
    iso.add_file(path, iso_filename(filename), rr_name=filename)

iso.add_eltorito(
        iso_filename(args.boot), 
        bootcatfile=iso_filename(args.boot_cat), 
        boot_load_size=4, 
        boot_info_table=True
)

iso.write(args.output)

iso.close()
