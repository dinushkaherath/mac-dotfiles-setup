import readline
import sys
import csv
import re
import os

replacements = {}
folder = '/Users/dinushkaherath/Documents/aText_subs/'

for filename in ['1-20.csv','1st-20th.csv','Substitutions.csv', 'combos.csv', 'propers.csv', 'slashes.csv']:
    with open(folder+filename, mode='r') as file:
        reader = csv.reader(file)
        replacements.update({rows[0]:rows[1] for rows in reader})
propers = {}
with open(folder+"propers.csv") as file:
    reader = csv.reader(file)
    propers.update({rows[0]:rows[1] for rows in reader})

def prepare(text):
    text = text[:1].lower() + text[1:]
    
    text = re.sub(r"([?!.] \w+)", lambda m: m.group(0).lower(), text)
    text = " "+text+" "
    return text

def replace(old, new, text):
    return re.sub(rf" {old}([ \",.!?;])", rf" {new}\1", text)

def repeat(text, dictionary, k, reverse):
    text = prepare(text)
    for k in sorted(dictionary, key=lambda k: len(replacements[k]), reverse=True):
        short = k
        long = replacements[k]
        text = replace(long, short, text)
    return text[1:-1]


def long_to_short(text):
    text = prepare(text)
    for k in sorted(replacements, key=lambda k: len(replacements[k]), reverse=True):
        short = k
        long = replacements[k]
        text = replace(long, short, text)
    return text[1:-1]


def short_to_long(text):
    text = prepare(text)
    for k in sorted(replacements, key=lambda k: len(k), reverse=False):
        short = k
        long = replacements[k]
        text = replace(short, long, text)
    return text[1:-1]

if __name__ == "__main__":
    if len(sys.argv) > 1:
        with open(sys.argv[1], 'r') as f:
            text = f.read().replace('\n', '')
        result = long_to_short(text)
        with open("converted.txt", 'w') as f:
            f.write(result)
    else:
        text = input("Text to convert:\n")
        print('\n')
        choice = input("What is this long or short?\n")
        print('\n')
        if "short" in choice:
            result = short_to_long(text)
        else:
            result = long_to_short(text)
        print(result)
