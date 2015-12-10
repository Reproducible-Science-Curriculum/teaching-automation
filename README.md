[![Build Status](https://travis-ci.org/reproducible-science-curriculum/teaching-automation.svg)](https://travis-ci.org/reproducible-science-curriculum/teaching-automation)

# Teaching automation

This is a repository to demonstrate how to automate the building and testing of
manuscripts to facilitate reproducible research.

# Narrative of Writing Process

Here is a walk through of how you might have written the
manuscript in this repository. Included in the walk through are references to
the Reproducible Science curriculum that discusses each feature as well as to
additional reference material on the subject.

## Picking a License

Github will ask you to pick a license when you make a new repository. Or, you
can add one later in a ''/LICENSE'' file.

* This is discussed in the Sharing, Publishing, and Archiving slides
* Further reading: [http://creativecommons.org/choose/](http://creativecommons.org/choose/)

## Keeping notes in README.md (this file)

Throughout the development process, keep a README.md file open and document the
process and outputs of your work directly in the repository. This keeps your 
notes with your code instead of in Word documents on your computer or Evernote
or some other place that no one else can access.

Subdirectories might need their own README.md file if there is a lot of
information people need to reproduce your work.

* This is discussed in the file organization slides.

## Downloading Raw Data

The raw data is kept in a subdirectory called ''/data-raw''. Also in this 
directory is a README.md file that contains a detailed description of where this
data came from and the process used to collect it.

* This is discussed in the File Organization slides.
* Further reading: [A Quick Guide to Organizing Computational Biology Projects, 2009](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)

## Reformatting & Summarizing Data

The original data is left untouched. Summarized data is written out by functions
to the ''/data-output'' directory using the code in ''R/data.R''.

* This is discussed in the File Organization slides.
* Further reading: [A Quick Guide to Organizing Computational Biology Projects, 2009](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)

Because this is the first piece of running code, a lot of other infrustructure
set up comes now. All these items are kept updated as the rest of the
manuscript development process continues.

### Add a .gitignore

Git can ignore files by putting file names or patterns in a file called
''.gitignore''. It is important to keep files that are automatically
generated out of version control.

* This is not discussed in the curriculum but here is a blog post:
[http://perlmaven.com/dont-keep-generated-files-in-version-control](http://perlmaven.com/dont-keep-generated-files-in-version-control)
* Further reading: [.gitignore Templates](https://github.com/github/gitignore)

### Put Code in Functions in the R directory

Functions for the various phases of analysis and for generating each part of the
results are grouped by topic into files in the ''/R'' directory. ''/R/data.R''
and ''/R/figures.R'' are used in this project.

* This is discussed in the Functions slides
* Ref?

### Start Writing Tests

Tests go in the ''/test'' directory and are written with the testthat library.
Typically there is one test file for each code file in ''/R'' that tests all
the functions in that file.

Some people choose to use a process called '''test driven development''' which
involves writing tests before the code.

* This is discussed in the testing slides.
* Ref: 

### Build a Makefile


### Add a Travis Badge

This is optional but a nice way to indicate the status of your code to others.
It is also a good way to keep track of when your collaborators have broken
something :)

* This is not presented in the testing slides.
* Further reading: [https://docs.travis-ci.com/user/languages/r](https://docs.travis-ci.com/user/languages/r)


## List Required Libraries In Once Place

The ''R/dependancies.R'' script contains all of the ''library()'' function calls
in one place so other people know what they need to install to get the project
working.

## Group Widely Used Functions into Utils.R

A file like ''R/utils.R'' is common for functions that get used across the whole
project in many ''.R files''. This is a catch-all place for simple things. For
larger and more focused functions, a dedicated file in ''R/'' is more
appropriate.

## Create a Configuration File With Parameters

Some options for the analysis, formatting, output types, etc may be things you
want to make it easy to change often. Those parameters can be separated out in
to a file either in a text format like YAML or JSON or, in this case, just
another R script ''R/manuscript_options.R'' that defines an options list.

