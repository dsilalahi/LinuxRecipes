
apt update

apt install software-properties-common


add-apt-repository ppa:deadsnakes/ppa
apt update


apt install python3.8
python3 --version

sudo apt install python3-pip
pip3 --version


pip3 install \
 apache-airflow[postgres,gcp]==1.10.10 \
 --constraint \
        https://raw.githubusercontent.com/apache/airflow/1.10.10/requirements/requirements-python3.7.txt



apt-get install -y --no-install-recommends \
	freetds-bin \
    krb5-user \
    ldap-utils \
    libffi6 \
    libsasl2-2 \
    libsasl2-modules \
    libssl1.1 \
    locales  \
    lsb-release \
    sasl2-bin \
    sqlite3 \
    unixodbc