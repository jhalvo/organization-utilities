# Takenote
This is a utility that creates and opens text documents for taking notes that correspond to the class listed in schedule.txt. Classes are stored in the following format:
```
<class name> <days of week> <starting time (hhmm)> <ending time (hhmm)> <directory notes are saved in>
```

For example,

```
CSC131 MonWedFri 0800 0840 Documents/CSC131-Intro-to-Programming/
```
Some values (like my name) are hard-coded in, I may move those to a config file later.

To run, put a sim-link in your bin folder that points at takenote.sh
```
<USER>:~/.bin$ sudo ln -s ~/Public/Utilities/takenote/takenote.sh takenote
```
