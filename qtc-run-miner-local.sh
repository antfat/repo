#!/bin/bash

while true; do
        cuda_count=$(nvidia-smi | grep " RTX" | wc -l)
            for (( i=0; i<cuda_count; i++ )); do
                export CUDA_VISIBLE_DEVICES=$i
                LD_LIBRARY_PATH=. && CUDA_VISIBLE_DEVICES=$i ./qubitcoin-miner-opt -a qhash -o qubitcoin.luckypool.io:8611 -u bc1qstxffvn68pkwexp4ly99p6kqeyqa8j56tg9ryl.r0$i -t 1 --cpu-affinity $i &
            done
done