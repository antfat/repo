#!/bin/bash

sudo echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list
apt update
apt install libc6
apt install -y g++-11

mkdir /qubic
cd /qubic

wget https://dl.qubic.li/downloads/qli-Client-1.8.6-Linux-x64.tar.gz
tar -xzvf qli-Client-1.8.6-Linux-x64.tar.gz
mkdir /qubic/gpu
cp /qubic/qli-Client /qubic/gpu/qli-Client

echo "{\"Settings\": { \"allowHwInfoCollect\": true, \"overwrites\": {\"CUDA\": \"12\"}, \"accessToken\": \"eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjU3YTQ5YmRiLTM3NTQtNDFmMS1iOWU1LWJmNWMxYjYzOWExMiIsIk1pbmluZyI6IiIsIm5iZiI6MTcwOTA3ODkxOSwiZXhwIjoxNzQwNjE0OTE5LCJpYXQiOjE3MDkwNzg5MTksImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.me5rkvLGJMQxoOZlEjFZNp92dwkUiOpR1nQiOPl5a3JlKi_6gzdQkV7Pi-x973_cUtMm2_CxeyRcOIRYh2JIhw\", \"baseUrl\": \"https://mine.qubic.li/\", \"alias\": \"polina\"}}" > /qubic/gpu/appsettings.json

cat >> /etc/supervisor/supervisord.conf <<\eof

[program:qubic_gpu]
command=/qubic/gpu/qli-Client
directory=/qubic/gpu
autostart=true
autorestart=true
stdout_logfile=/dev/fd/1
stdout_logfile_maxbytes=0
eof

supervisorctl reload