```
git remote -v # remote verbs
git remote rename origin {new name} # update remote verbs
```

# add files to git
```
git add file(s)
git commit -m "comments"
git push origin master
```

# remove files to git
git rm file(s)
git commit -m "comments"
git push origin master

# delete remote files but not local
git rm --cached file1
git commit -m "remove file1"
git push origin master

# take the current branch and points it to the HEAD of the remote branch.
git fetch origin
git reset --hard origin/master