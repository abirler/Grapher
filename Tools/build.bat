@echo off

pushd %~dp0

rd /s /q ..\Build
md ..\Build\Debug
md ..\Build\Release

copy ..\Samples\*.* ..\Build\Debug\
copy ..\Samples\*.* ..\Build\Release\

copy ..\Tools\d3.v3.js ..\Build\Debug\
copy ..\Tools\d3.v3.min.js ..\Build\Release\d3.v3.js

copy ..\Source\grapher.css ..\Build\Debug\grapher.css
copy ..\Source\grapher.css ..\Build\Release\grapher.css

echo Building 'Debug\grapher.js'

set Source=
for %%i in ("../Source/*.ts") do call set Source=%%Source%% ../Source/%%i
node tsc.js -target ES5 -out ..\Build\Debug\grapher.js lib.d.ts d3.d.ts %Source%

echo Building 'Release\grapher.js'

node minify.js ..\Build\Debug\grapher.js ..\Build\Release\grapher.js

popd

echo Done.
