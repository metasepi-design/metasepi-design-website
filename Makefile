all: build

hakyll: hakyll.hs
	ghc --make -Wall hakyll.hs -o hakyll

build: hakyll
	./hakyll build

server: build
	./hakyll preview -p 9876

publish: build
	cp -pr _site/* ~/doc/metasepi-design.github.io

lint: hakyll.hs
	hlint -c hakyll.hs

clean:
	-./hakyll clean
	rm -rf hakyll
	rm -rf *.hi *.o
	rm -rf *~

.PHONY: build server publish lint clean
