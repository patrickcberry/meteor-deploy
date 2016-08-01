#!/bin/sh

echo 'Generate security keys'
echo '----------------------------------'
echo 'usage sh keygen.sh output-file-name'

# Generate the key pair
#
# -t rsa	RSA key type
# -b 4096	Number of bits in the key
# -v		Verbose output
# -f $1		Key output file
# -N ""		Pass-phrase

ssh-keygen -t rsa -b 4096 -v -f $1 -N ""

# Rename the key file to .pem

mv $1 $1.pem -f