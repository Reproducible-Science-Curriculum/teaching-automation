[![Build Status](https://travis-ci.org/fmichonneau/teaching-automation.svg)](https://travis-ci.org/fmichonneau/teaching-automation)

# Teaching automation

This is a repository to demonstrate how to automate the building and testing of
manuscripts to facilitate reproducible research.

# Narrative of Writing Process

Here is a walk through of how you might have written the
manuscript in this repository. Included in the walk through are references to
the Reproducible Science curriculum that discusses each feature as well as to
additional reference material on the subject.

## Picking a License

## Keeping notes in README.md (this file)

## Downloading Raw Data

The raw data is kept in a subdirectory called ''/data-raw''. Also in this 
directory is a README.md file that contains a detailed description of where this
data came from and the process used to collect it.

* This is discussed in the File Organization slides.
* Further reading: [A Quick Guide to Organizing Computational Biology Projects, 2009](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)

## Reformatting & Summarizing Data

The original data is left untouched. Summarized data is written out by functions
to the ''/data-output'' directory

* This is discussed in the File Organization slides.
* Further reading: [A Quick Guide to Organizing Computational Biology Projects, 2009](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)

Because this is the first piece of running code, a lot of other infrustructure
set up comes now. All these items are kept updated as the rest of the
manuscript development process continues.

### Add a .gitignore

Git can ignore files by putting patterns in a file called ''.gitignore''. 

* Further reading: [.gitignore Templates](https://github.com/github/gitignore)

### Put Code in Functions in the R directory

### Start Writing Tests

### Build a Makefile

### Add a Travis Badge

This is optional but a nice way to indicate the status of your code to others.
It is also a good way to keep track of when your collaborators have broken
something :)

* This is not presented in the testing slides.
* Further reading: [https://docs.travis-ci.com/user/languages/r](https://docs.travis-ci.com/user/languages/r)

