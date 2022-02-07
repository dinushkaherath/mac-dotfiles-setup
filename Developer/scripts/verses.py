import urllib.request
import urllib.parse
import sys
import json
import random
import os
from pathlib import Path
from datetime import date

today = date.today()
random.seed(today.strftime("%d/%m/%Y"))

i = "no input"
no_input = False

try:
    i = " ".join(sys.argv[1:])
    if i == "":
        file = Path('/Users/dinushkaherath/Developer/scripts/today.verse');
        if file.is_file():
            today_verse = date.fromtimestamp(file.stat().st_mtime)
        if file.is_file() and today == today_verse:
            f = open("/Users/dinushkaherath/Developer/scripts/today.verse", "r")
            print(f.read())
            f.close()
            sys.exit()
        no_input = True
        lines = open('/Users/dinushkaherath/Developer/scripts/520vvs.txt').read().splitlines()
        i = random.choice(lines)
    link = "https://api.lsm.org/recver.php?String='" + i + "'&Out=json"
    link = link.replace(" ","%20")
    f = urllib.request.urlopen(link)
    i = f.read().decode('utf-8')
    i = json.loads(i)
    o = "\n" + i["detected"] + "\n"
    for verse in i["verses"]:
        o += verse["text"] + "\n"
    print(o)
    if no_input:
        f = open("/Users/dinushkaherath/Developer/scripts/today.verse", "w")
        f.write(o)
        f.close()
except:
    if i != "":
        print(i)
    

