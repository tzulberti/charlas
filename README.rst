README
++++++

Repo with different talks I gave at different events




Meetup PyAr 2018
----------------

Introduction talk about how to use cython.

There are some folders:

- pure-c: Pure C implementation used to benchmark the code
- pure-python: a Python implementation of the program
- cython-first-version: an implementaion of the cython version after
  cythonizing difference.py
- cython-types-version: implementation using cython decorators to
  optimize the generated code


PyConAr 2018
------------

The same folder structure as the one as the used for the meetup

In this case, nimble is needed:

::

    curl https://nim-lang.org/choosenim/init.sh -sSf | sh
    nimble install nimpy@0.1.0

