crontab -u username -e

# entries of cur users
crontab -l

# [Minute] [Hour] [Day_of_the_Month] [Month_of_the_Year] [Day_of_the_Week] [command]


# schedule to backup db daily
0 2 * * * /bin/sh backup.sh

# execute the following script 2x daily at 4 am and 6 pm 
0 4,18 * * * /scripts/script.sh


# execute weekly task at 9 pm every Sunday
0 21 * * sun  /scripts/script.sh

# execute a task at 5 pm on selected days: Sunday and Friday
0 17 * * sun,fri  /script/script.sh

# execute a task at 5 pm on selected days: Sunday and Friday
0 2 * * sun  [ $(date +%d) -le 07 ] && /script/script.sh


# execute a script at the 1st minute of every month
@monthly /scripts/script.sh
# or
0 0 1 * * /scripts/script.sh