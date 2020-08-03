python3 -m venv target-folder/
source bin/activate

pip3 install Django


# create a project
django-admin startproject mysite

# create db
python manage.py migrate

# create superuser
python manage.py createsuperuser

# create new app
python manage.py startapp app_name

# run server
python manage.py runserver

# initialize app’s local db
# create a model
python manage.py makemigrations
python manage.py migrate