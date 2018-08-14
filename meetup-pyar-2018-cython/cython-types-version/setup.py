"""A setuptools based setup module.

See:
https://packaging.python.org/en/latest/distributing.html
https://github.com/pypa/sampleproject
"""

# Always prefer setuptools over distutils
from setuptools import setup, find_packages
from Cython.Build import cythonize
from os import path
from io import open

here = path.abspath(path.dirname(__file__))

with open(path.join(here, 'README.rst'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='meetup',  
    version='1.2.0',  
    description='A sample Python project', 
    long_description=long_description,  
    ext_modules=cythonize("src/difference.py"),
    url='https://github.com/pypa/sampleproject',  
    author='The Python Packaging Authority',  
    author_email='pypa-dev@googlegroups.com',  
    classifiers=[  
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
    ],
    packages=find_packages(exclude=['contrib', 'docs', 'tests']),
)
