#!/bin/sh

unittests=(./test/test_accuracy_check.py ./test/test_training_data.py ./test/lib/test_chart_drawer.py)
for unittest in ${unittests[@]}
do
  python $unittest
done
