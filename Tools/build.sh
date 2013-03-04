#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

rm -f -r ../Build
mkdir -p ../Build/Debug
mkdir -p ../Build/Release

cp ../Samples/*.* ../Build/Debug/
cp ../Samples/*.* ../Build/Release/

cp ../Tools/d3.v3.js ../Build/Debug/
cp ../Tools/d3.v3.min.js ../Build/Release/d3.v3.js

cp ../Source/grapher.css ../Build/Debug/grapher.css
cp ../Source/grapher.css ../Build/Release/grapher.css

echo Building \'Debug/grapher.js\'

node tsc.js -target ES5 -out ../Build/Debug/grapher.js lib.d.ts d3.d.ts ../Source/*.ts

echo Building \'Release/grapher.js\'

node minify.js ../Build/Debug/grapher.js ../Build/Release/grapher.js

echo Done.
