# install openssl 
sudo yum -y install mod_ssl yum install openssl

# generate 2048-bit private key
# replace:[filename] = location/filename.key 
sudo openssl genrsa -des3 -out [filename].key 2048

# generate csr
# replace: [private] -- point to the previously created .key
# replace: [filename] -- location/filename.csr
openssl req -new -key [private].key -out [filename].csr
# Country: US
# State: full state name
# Location: full city name
# Organization: company name
# Org. Unit: department such as HR, IT, etc
# CName: [www].[domain].[com]

# OR
# openssl req -new -newkey rsa:2048 -nodes -out www_xxxx_com.csr -keyout www_xxxx_com.key -subj # "/C=US/ST=Maryland/L=Bethesda/O=Ideation816 Corp/OU=IT/CN=www.XXXX.com"



# test SSLV2 and SSLV3
openssl s_client -connect f.q.d.n:443 -ssl2
openssl s_client -connect f.q.d.n:443 -ssl3