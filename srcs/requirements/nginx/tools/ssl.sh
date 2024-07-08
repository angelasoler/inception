#!/bin/bash
 
cd ../conf && \
openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout asoler.42.fr.key -out asoler.42.fr.crt -subj "/C=US/ST=California/L=San Francisco/O=MyCompany/OU=IT/CN=asoler.42.fr"
