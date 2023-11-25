#!/bin/bash
echo "export http_proxy=http://192.168.199.35:8080"
echo "export https_proxy=http://192.168.199.35:8080"
echo "export ftp_proxy=http://192.168.199.35:8080"
echo "export HTTP_PROXY=$http_proxy"
echo "export HTTPS_PROXY=$https_proxy"
echo "export FTP_PROXY=$ftp_proxy"
echo "export no_proxy="localhost,.bildung-rp.de,127.0.0.0/8,192.168.199.0/24""
echo "export NO_PROXY=$no_proxy"
