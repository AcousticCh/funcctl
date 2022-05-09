#!/bin/bash

shc -f $2 -o $1
rm ./$2.x.c
mv $1 /usr/bin
