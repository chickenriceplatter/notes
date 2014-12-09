how to set permissions on files
---

##### set user, group and other to read, write and execute
```bash
chmod ugo=rwx filename
chmod 777 filename
```

##### set user to read, write, execute, group to read, write and other to read
```bash
chmod u=rwx, g=rw, o=r filename
chmod 764 filename
```

##### add write to user and group
```bash
chmod ug+w filename
```

##### take away write from other
```bash
chmod o-w filename
```

##### add read and write to user, group and other
```bash
chmod ugo+rw filename
```

##### add read and write to user, group and other (a stands for all)
```bash
chmod a+rw filename
```

### octal notation
```
r = 4
w = 2
x = 1

first digit = user
second digit = group
third digit = other
```


##### rwx for user, group and other
```bash
chmod 777 filename
```

##### rwx for user, rw for group and r for other
```bash
chmod 764 filename
```

##### rwx for user only
```bash
chmod 700 filename
```


