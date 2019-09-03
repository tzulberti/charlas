# delete all the cython generated files
find . -name "*.pyc" -exec rm -rf {} \;
find . -name "*.so" -exec rm -rf {} \;
find . -name "*.pyo" -exec rm -rf {} \;
rm -rf pure-c/levenshtein

source ~/envs/charlas/bin/activate
pip install -r requirements.txt


cd pure-c
rm -rf time_output.txt
gcc -o levenshtein levenshtein.c

echo 'pure c benchmark' >> time_output.txt
{ time ./levenshtein ../dataset.1.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.3.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.7.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.15.txt ; } 2>> time_output.txt


cd ../pure-python
rm -rf time_output.txt
echo 'pure python benchmark' >> time_output.txt

{ time python main.py ../dataset.1.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.3.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.7.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.15.txt ; } 2>> time_output.txt

cd ../cython-first-version
rm -rf time_output.txt
rm -rf difference.c

echo 'cython-first-version benchmark' >> time_output.txt
cythonize --inplace difference.py

{ time python main.py ../dataset.1.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.3.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.7.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.15.txt ; } 2>> time_output.txt



cd ../cython-types-version
rm -rf time_output.txt
rm -rf difference.c

echo 'cython-types-version benchmark' >> time_output.txt
cythonize --inplace difference.py

{ time python main.py ../dataset.1.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.3.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.7.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.15.txt ; } 2>> time_output.txt


cd ../cython-array-length-check
rm -rf time_output.txt
rm -rf difference.c

echo 'cython-array-length-check benchmark' >> time_output.txt
cythonize --inplace difference.py

{ time python main.py ../dataset.1.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.3.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.7.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.15.txt ; } 2>> time_output.txt


cd ../python-levenshtein/
rm -rf time_output.txt

echo 'python-levenshtein/ benchmark' >> time_output.txt

{ time python main.py ../dataset.1.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.3.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.7.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.15.txt ; } 2>> time_output.txt


