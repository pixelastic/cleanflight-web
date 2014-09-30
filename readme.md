# Building Cleanflight-Web 

## Prerequisites
- node.js (+npm)

## Development Environment Setup
install dev dependencies
```bash
sudo npm install -g gulp bower
cd cleanflight-web
npm install
bower install
```

## Building
Bulding is managed by gulp. To compile the website call:
```
gulp build
```
and find the generated files in the ```dist``` directory.

## Developing
to launch an embedded web server with "live editing" capabilities, launch:
```gulp watch```
Editing files in the ```app``` directory should have immediate effect in the browser. Dependencies are managed by ```bower```.

