---
layout: single
title:  "The octopus testsuite web app"
date:   2020-07-15 16:08:04 +0200
tags: octopus web
---

The [octopus code](https://octopus-code.org) is a simulation program for doing
calculations within density functional theory (DFT), especially time-dependent
DFT. It uses pseudopotentials for the interaction between electrons and nuclei.

The recently developed testsuite web app is available at
[https://octopus-code.org/testsuite/](https://octopus-code.org/testsuite/).

I also explain this in a [how-to-video on Youtube](https://youtu.be/uJK3QkJxQ0g).


## What is the testsuite?

We want to make sure that new developments in the code do not break existing
features. Moreover, the code should run consistently using different compilers
or different hardware. To achieve this, octopus contains a testsuite that is run
regularly through buildbot which is coupled to the
[gitlab repository](https://gitlab.com/octopus-code/octopus) using continuous
integration (CI). The testsuite contains many different input files and checks
to validate the output of each run. If one of those tests fails, the testsuite
fails in the CI interface and the corresponding merge request cannot be merged.
The testsuite is run for a variety of compiler and MPI versions (gcc and
OpenMPI, Intel compilers and MPI) and on different hardware (x86 and PowerPC
CPUs, Nvidia GPUs).


## Why a testsuite web app?

Now all this amounts to about 30 runs per commit with about 20000 matches each.
If one or several tests fail for one or more runs, it is quite difficult to
analyze this in the current buildbot interface. Hence, we wanted to have an
easier way of analyzing the data and comparing the same test for different runs
(i.e. compilers and/or hardware) and this is why we decided to have a dedicated
web application.


## How to use the web app?

When going to the [web app](https://octopus-code.org/testsuite/), the first page
presents an overview of recently changed branches from gitlab and shows which
are available in the app database. Moreover, there are overviews for the commits
in the database and for the most recent commits from gitlab.

When choosing a commit, the details for this commit are displayed: a list of
tests that can be compared for the different runs and a list of runs that can be
examined in detail. The comparison of a test shows a table with results for each
match line in the test file. For each match, a plot is shown with the
distribution of the results and with the reference value to judge how good the
match is and if the distribution is unusual. Sometimes, it can for example
indicate issues for the MPI version versus the serial version. Each match can be
also analyzed individually: here, the values for all runs are displayed, so one
can really check in detail which values are fine and which are wrong. In
addition, match lines can be generated that use the values from the runs and
that can be used to update the test files. From this page, one can also look at
the values for one specific match line, its input, or its run. 

When a commit contains failed tests, those are displayed directly at the top
to quickly see which tests fail and to easily access their details.


## How does it work?

The buildbot instance that runs the testsuite collects the data from the
testsuite run and uploads this to the web app. The web app then inserts this
data into its database.

The web app is based on [django](https://www.djangoproject.com/), using a
[postgres](https://www.postgresql.org/) database. For the display part,
[bootstrap](https://getbootstrap.com/) is used in combination with
[bokeh](https://bokeh.org/) for the plots.
