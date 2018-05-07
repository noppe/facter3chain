# frozen_string_literal: false
require 'mkmf'

INCLUDEDIR = RbConfig::CONFIG[ 'includedir' ]
LIBDIR = RbConfig::CONFIG[ 'libdir' ]
HDR = [ '/opt/aiaiao/include', '/opt/aiaiao/include/ruby-2.5.0', INCLUDEDIR, ]
LIB = [ '/opt/aiaiao/lib', LIBDIR, ]
dir_config("gdbm", HDR, LIB)
if have_library("gdbm", "gdbm_open") and
   have_header("gdbm.h")
  checking_for("sizeof(DBM) is available") {
    if try_compile(<<SRC)
#include <gdbm.h>

const int sizeof_DBM = (int)sizeof(DBM);
SRC
      $defs << '-DDBM_SIZEOF_DBM=sizeof(DBM)'
    else
      $defs << '-DDBM_SIZEOF_DBM=0'
    end
  }
  create_makefile("gdbm")
end
