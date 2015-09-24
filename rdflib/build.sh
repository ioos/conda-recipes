#!/bin/bash

# Ugly hack to avoid circular dependency issue.
# (See https://github.com/RDFLib/rdflib/issues/391).

pip install SPARQLWrapper

$PYTHON setup.py install --single-version-externally-managed  --record record.txt
