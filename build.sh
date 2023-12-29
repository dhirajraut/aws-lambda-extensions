#!/bin/bash

echo "Launching Build"
mvn clean install

echo "Building extensions package"
cd aws-lambda-extensions
chmod +x extensions/java.sh
archive="extensions.zip"
if [ -f "$archive" ] ; then
    rm "$archive"
fi
zip "$archive" extensions/java.sh #Add with path. Lambda is going to extract the zip in /opt folder and then check all files in /opt/extensions folder.
zip "$archive" -j target/aws-lambda-extensions-0.0.1-SNAPSHOT.jar #Add the Jar file without path.
cd ..