awk
===

terms
---

- FS - field separator
- RS - record separator
- NF - number of fields
- NR - number of records


remove first line of file
---
```bash
awk 'NR > 1' old_file_name.txt > truncated_file_name.txt
```
