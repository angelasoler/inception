#!/bin/bash
 
cd ../conf && \
openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt -subj "/C=US/ST=California/L=San Francisco/O=MyCompany/OU=IT/CN=localhost"
