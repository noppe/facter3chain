
all: build-boost build-curl build-yaml build-leatherman \
	build-cpp-hocon build-ruby build-facter

build-boost:
	gmake -f boost build

test-boost:
	(cd tests/boost && gmake)

build-curl:
	gmake -f curl build

test-curl:
	(cd tests/curl && gmake)

build-yaml:
	gmake -f yaml build

build-leatherman:
	gmake -f leatherman build

build-cpp-hocon:
	gmake -f cpp-hocon build

build-ruby:
	gmake -f ruby build

build-facter:
	gmake -f facter build
