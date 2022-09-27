#!/bin/sh

export LD_LIBRARY_PATH=./unix/:$LD_LIBRARY_PATH
./unix/worker -p2195 -w01a871f050ed0f519761935a -l
