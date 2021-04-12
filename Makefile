all: build

build:
	stack build
	stack run metasepi-design build

server: all
	stack run metasepi-design watch

publish: build
	cp -pr _site/* ~/doc/metasepi-design.github.io

lint: src/Main.hs
	hlint -c src/Main.hs

clean:
	stack run metasepi-design clean
	stack clean
	rm -rf hakyll
	rm -rf *.hi *.o
	rm -rf *~

.PHONY: build server publish lint clean
