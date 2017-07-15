red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
reset=`tput sgr0`

info="$(blue)[INFO]"
ok="$(green)[OK]"
warn="$(yellow)[WARN]"
error="$(red)[ERROR]"

source = $(shell find ./src/elm -name "*.elm")
elm-bundle = build/bundle.js
webpack-bundle = build/bundle.js

.PHONY: elm-reactor default electron server

default: server

$(elm-bundle): $(source) node_modules
	elm make $(source) --output $(elm-bundle)

$(webpack-bundle): $(source) node_modules
	./node_modules/.bin/webpack

electron:HOST=localhost
electron:WEBPACK_PORT=8080
electron: node_modules
	./node_modules/.bin/webpack-dev-server --host $(HOST) --port $(WEBPACK_PORT) --content-base /build/ &
	./node_modules/.bin/electron ./src/static/electron.js

server:PORT=8000
server:HOST=0.0.0.0
server:WEBPACK_PORT=8122
server: node_modules
	./node_modules/.bin/webpack-dev-server --host $(HOST) --port $(WEBPACK_PORT) --content-base /build/ &
	@echo "$(info) Visit http://$(HOST):$(PORT)/src/static/electron.html to see bundle$(reset)"
	python -mSimpleHTTPServer $(PORT)

elm-reactor:
	elm-reactor

node_modules: package.json
	npm install

