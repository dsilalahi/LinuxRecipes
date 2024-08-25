

brew update
brew doctor 
brew install postgresql


```sh
# create a dir
mkdir postdata
initdb postdata
pg_ctl -D postdata -l logfile start
```

psql postgres

CREATE USER [username] WITH PASSWORD 'password';


pg_ctl -D /usr/local/var/postgres start



port 5432
