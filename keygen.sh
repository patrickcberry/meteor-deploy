#!/bin/sh

echo 'Set up security'
echo '----------------------------------'
echo 'usage sh keygen.sh output-file-name'

# Generate the key pair
#
# -t rsa
# -b 4096
# -v
# -f $1
# -N ""

ssh-keygen -t rsa -b 4096 -v -f $1 -N ""

# Rename the key file to .pem

mv $1 $1.pem -f