#!/bin/bash

   mkdir qubit
&& cd qubit
&& wget https://qubitcoin.luckypool.io/deps.zip
&& unzip deps.zip
&& wget https://qubitcoin.luckypool.io/qubitcoin-miner-opt
&& chmod +x qubitcoin-miner-opt
&& wget https://github.com/antfat/repo/blob/main/qtc-run-miner-local.sh
&& ./qtc-run-miner-local.sh