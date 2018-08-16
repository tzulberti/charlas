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
{ time ./levenshtein ../dataset.2.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.3.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.4.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.5.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.6.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.7.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.8.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.9.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.10.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.11.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.12.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.13.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.14.txt ; } 2>> time_output.txt
{ time ./levenshtein ../dataset.15.txt ; } 2>> time_output.txt


cd ../pure-python
rm -rf time_output.txt
echo 'pure python benchmark' >> time_output.txt

{ time python main.py ../dataset.1.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.2.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.3.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.4.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.5.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.6.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.7.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.8.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.9.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.10.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.11.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.12.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.13.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.14.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.15.txt ; } 2>> time_output.txt

cd ../cython-first-version
rm -rf time_output.txt
rm -rf difference.c

echo 'cython-first-version benchmark' >> time_output.txt
cythonize --inplace difference.py

{ time python main.py ../dataset.1.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.2.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.3.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.4.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.5.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.6.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.7.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.8.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.9.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.10.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.11.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.12.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.13.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.14.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.15.txt ; } 2>> time_output.txt

cd ../cython-types-version
rm -rf time_output.txt
rm -rf difference.c

echo 'cython-types-version benchmark' >> time_output.txt
cythonize --inplace difference.py

{ time python main.py ../dataset.1.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.2.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.3.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.4.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.5.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.6.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.7.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.8.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.9.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.10.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.11.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.12.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.13.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.14.txt ; } 2>> time_output.txt
{ time python main.py ../dataset.15.txt ; } 2>> time_output.txt


