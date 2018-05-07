include common

all:
	@echo Nah .. make prep or build instead

PKG = ruby-2.5.0.tar.gz
URL = https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz
WORK = ${FACTORY}/ruby-2.5.0


${PKG}:
	(cd ${DUMP} && test -f ${PKG} || wget ${URL})

${WORK}: ${PKG}
	(cd ${FACTORY} && test -d ruby-2.5.0 || gtar zxvf ${DUMP}/${PKG} )

prep: ${WORK}

clean:
	(cd ${FACTORY} && rm -rf ruby-2.5.0)

build: ${WORK}
	echo ${PATH}
	(cd ${WORK} && gmake -I${ORIGIN} -f ${ORIGIN}/ruby stageB)

stageB:
	./configure --prefix=${PREFIX} --enable-pthread --enable-shared --disable-install-doc --with-openssl-dir=${PREFIX} --with-readline-dir=${PREFIX} --with-out-ext=gdbm --without-fiddle linkflags="-std=c1x -Wl,-rpath=${PREFIX}/lib"
	gmake -j 5
	gmake install
	cd ext/gdbm && gmake -I${ORIGIN} -f ${ORIGIN}/ruby stageGdbm

stageGdbm:
	${PREFIX}/bin/ruby extconf.rb --with-gdbm-dir=/opt/aiaiao
	gmake top_srcdir=../.. -j 5
	gmake top_srcdir=../.. install

