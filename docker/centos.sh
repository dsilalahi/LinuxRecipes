docker pull centos

# for a specific version
docker pull centos:6.6

# run centos in a container
docker run -i -t centos


# install python3 pip
yum update
yum -y install python3-pip

# verify pip is installed
pip3 -V


# install airflow with postgres and gcp
pip3 install \
 apache-airflow[postgres,gcp]==1.10.10 \
 --constraint \
        https://raw.githubusercontent.com/apache/airflow/1.10.10/requirements/requirements-python3.7.txt