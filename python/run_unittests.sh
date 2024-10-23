#!/bin/sh

for unittest in $(find . -name test_*.py -type f)
do
  python $unittest
done
