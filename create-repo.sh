#!/bin/bash

if [[ ! -d ./personal-projects/$1 ]]; then
    mkdir ../$1
fi

git init
git remote add origin git@github.com:$2/$1.git

echo "# $1" >> ../$1/README.md
ignore_files=('venv/' '**/*.pyc' '**/*pychache' '**/*_cache' '.env')

for i in "${ignore_files[@]}"; do
    echo "$i" >> ../$1/.gitignore
done

mkdir ../$1/src ../$1/tests
touch ../$1/src/main.py ../$1/tests/test-main.py

git add .
git commit -m "initial commit"
git push origin main