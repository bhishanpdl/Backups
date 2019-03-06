# Upload a file 

```bash
# Usage: upl hello.py
function upl () {
    cd ~/github/Everything
    git pull
    cd -
    cp $1 ~/github/Everything/Daily_Backup/"`date +%Y-%b-%d`"_$1
    cd ~/github/Everything/Daily_Backup
    git add "`date +%Y-%b-%d`"_$1
    git commit -m "`date +%Y-%b-%d`"
    git push origin master
    cd -
}
```
