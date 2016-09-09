# cleanflight-web

Website for the Cleanflight project

##Pre-Requisites

* ruby1.9.2
* rubygems
* ruby bundler 1.1.4
* node.js 0.12.5

easiest way to set up ruby, rubygems and bundler in their correct versions is to use rvm

##Installation

check out using either:
```
git clone --recursive git://github.com/cleanflight/cleanflight-web
```

or when working with an existing copy (inside the ```cleanflight-web``` directory):

```
git submodule update --init --recursive
```

## Develpment Environment Initialization

within the ```cleanflight-web``` directory:

### nmp and node
```
npm install
sudo npm install -g gulp
```

### ruby
```
sudo gem install nokogiri -v '1.6.6.2'
sudo bundle
```

and generate the docs / build the site:

```
gulp build
```

and finally publish the web site to gh-pages (after docs, build)

```
gulp deploy
```
