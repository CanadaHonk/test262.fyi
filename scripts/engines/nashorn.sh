#!/bin/bash

# install java 13
# sudo apt install openjdk-13-jre-headless

jjs -version
java -version

nashorn="$(jjs -version <<< "exit()" 2>&1 | head -n 1 | cut -d ' ' -f2)"
# java="$(java -version 2>&1 | head -n 1 | cut -d ' ' -f3 | tr -d '"')"

# echo "$nashorn from openjdk $java" > version.txt

# nashorn and openjdk version are the same, not needed
echo "$nashorn" > version.txt

./scripts/test262.sh nashorn "$(which jjs)" 8
