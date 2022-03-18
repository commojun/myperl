.PHONY: build

build:
	docker build -t myperl:latest .

link:
	-mkdir -p ~/bin
	-ln -s `pwd`/perl-docker ~/bin/perl-docker
	-ln -s `pwd`/perl-docker-root ~/bin/perl-docker-root
	echo "please add ~/bin to PATH"
