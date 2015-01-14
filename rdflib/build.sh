#!/bin/bash

wget -O $PREFIX/lib/python2.7/site-packages/SPARQLWrapper-1.6.4-py2.7.egg https://pypi.python.org/packages/2.7/S/SPARQLWrapper/SPARQLWrapper-1.6.4-py2.7.egg#md5=1ff0d9c168ed302f03901d753a1a76c5
$PYTHON setup.py install
