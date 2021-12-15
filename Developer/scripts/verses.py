import urllib.request
import urllib.parse
import sys
import json

i = "no input"

try:
    i = " ".join(sys.argv[1:])
    link = "https://api.lsm.org/recver.php?String='" + i + "'&Out=json"
    link = link.replace(" ","%20")
    f = urllib.request.urlopen(link)
    i = f.read().decode('utf-8')
    i = json.loads(i)
    o = "\n" + i["detected"] + "\n"
    for verse in i["verses"]:
        o += verse["text"] + "\n"
    print(o)
except:
    print(i)
    

