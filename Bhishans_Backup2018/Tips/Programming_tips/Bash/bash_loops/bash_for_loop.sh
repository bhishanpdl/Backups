#!/bin/bash

# bash bash_for_loop.sh

#for i in $( ls ); do
for i in $( seq 1 5 ); do
      echo $i
  done

# for i in $(seq 1 10); do echo $i; done
for i in $(seq 1 5); do echo folder1/file_$i; done
