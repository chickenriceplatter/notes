awk
===

terms
---

- FS - field separator
- RS - record separator
- NF - number of fields
- NR - number of records


copy first line of file to another file
---
```bash
awk 'NR==1' file_name.txt > headers.txt

# head command can also be used
head -1 file_name.txt > headers.txt
```

remove first line of file
---
```bash
awk 'NR > 1' old_file_name.txt > truncated_file_name.txt
```
