CPATH= '.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -e ListExamples.java ]]
    then 
        echo "List Examples Found"
else
    echo "file not found"
    exit
fi

mkdir lib
cp ../lib/hamcrest-core-1.3.jar lib
cp ../lib/junit-4.13.2.jar lib

cp ../TestListExamples.java TestListExamples.java

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java 2>javac-errors.txt

if [[ $? -ne 0 ]]
then
    echo "error involving javac"
fi

java -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples