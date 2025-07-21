#!/bin/bash

mkdir -p ssl

cat << EOF > ssl/req.cnf
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
prompt = no

[req_distinguished_name]
C = JP
ST = Tokyo
L = Tokyo
O = Ishiori
OU = Mizuki Cluster
CN = Mizuki Dex

[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = dex.mizuki.otaprv.ishiori.net
EOF

openssl genrsa -out ssl/ca-key.pem 4096
openssl req -x509 -new -nodes -key ssl/ca-key.pem -days 10 -out ssl/ca.pem -subj "/CN=Ishiori Mizuki Dex CA"

openssl genrsa -out ssl/key.pem 4096

openssl req -new -sha256 -key ssl/key.pem -out ssl/csr.pem  -config ssl/req.cnf

openssl x509 -req -in ssl/csr.pem -CA ssl/ca.pem -CAkey ssl/ca-key.pem -CAcreateserial -out ssl/cert.pem -days 3650 -extensions v3_req -extfile ssl/req.cnf

openssl verify -CAfile ssl/ca.pem ssl/cert.pem