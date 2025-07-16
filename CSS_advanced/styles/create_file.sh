#!/bin/bash

filename=$(ls -1 | grep ^'[0-9]' | sort -V | tail -n 1)
prevNum=${filename%-style.css}
newNum=$((prevNum + 1))
cp $filename "${newNum}-style.css"
code "${newNum}-style.css"