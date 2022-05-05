#!/bin/bash
for i in $(ls -1 data/pages/); do ./moin2md.sh $i $PWD $PWD/out; done
