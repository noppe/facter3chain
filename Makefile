
all: build-boost build-curl build-yaml build-leatherman \
	build-cpp-hocon build-ruby build-facter

build-boost:
	gmake -f boost build

test-boost:
	(cd tests/boost && gmake)

build-ssl:
	gmake -f openssl build

build-curl:
	gmake -f curl build

test-curl:
	(cd tests/curl && gmake)

build-gdbm:
	gmake -f gdbm build

build-readline:
	gmake -f readline build

build-libxml2:
	gmake -f libxml2 build

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
