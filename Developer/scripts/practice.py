import time
import readline
import converter
import difflib as dl
import re
import sys

with open('text/practice.txt', 'r') as file:
    type_this = file.read()

type_this = converter.prepare(type_this)


def practice(text):
    counter = 0
    begin = time.time()
    #type_this = "We also need to be those who are abiding in the Father."
    print(text)
    print("\n")

    String = input("")

    duration = time.time() - begin
    long = converter.short_to_long(String)
    compare = converter.long_to_short(text)

    differences = ""
    for diff in dl.context_diff(compare.split(), String.split()):
        differences += diff

    print(differences)
    counter = differences.count("***************")

    wpm = len(long)/5/duration*60

    print(str(wpm) + " wpm")
    if counter < 1:
        print('Great accuracy!')
    else:
        print(f'Work on your accuracy. You had {counter} mistakes.')
    return wpm


if len(sys.argv) > 1:
    import nltk
    sentences = nltk.tokenize.sent_tokenize(type_this)
    for sentence in sentences:
        words = len(sentence.split())
        print("")
        stop = False
        while not stop:
            speed = int(sys.argv[1])
            wpm = practice(sentence)
            for i in range(3):
                if wpm < speed:
                    wpm = practice(sentence)
                speed -= 15

            #repeat = input("Do you want to retry? y/n\n\n")
            # if not re.search(r'y|Y',repeat):
            stop = True
else:
    practice(type_this)
