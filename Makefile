
# you can build the library using cabal configure && cabal build
# more info here: http://jakewheat.github.com/hssqlppp/devel.txt.html

# this makefile can be used:
# * when the .ag files are altered to rebuild the hs
# * to build/ run the tests
# * to build all the examples
# * to build/run other development utils

# the default make target is to build the automated tests exe

# Why does this project have a makefile?
#
# Compiling with multiple cabal projects is slow
# Not all the code which should be compiled during development belongs in a cabal package
# I didn't work out how to use uuagc and other custom build steps with cabal
# Make can compile stuff in parallel
# I have a tool which automatically works out the dependencies and package dependencies


########################################################

# developing with the make file:

# to add new source folder, adjust the SRC_DIRS var below
# to add a new binary to build, add it to EXE_FILES below

# you also need the package 'package-o-tron' from hackage
# (see https://github.com/JakeWheat/package-o-tron)

# if you alter the catalog type or any other dependencies, you may
# need to regenerate the defaultTemplate1Catalog module, this is
# never automatic, use 'make regenDefaultTemplate1Catalog'
# this needs postgresql installed

######################################################

# this makefile is probably written wrong since I don't know how to do
# makefiles

# add new source roots to this
SRC_DIRS = hssqlppp/src hssqlppp/tests/ \
	   hssqlppp-pg/src \
	   hssqlppp-th/src hssqlppp-th/tests \
	   build-src \
	   examples \
	   src-extra/chaos/h7c src-extra/chaos/extensions src-extra/chaos/chaos
	   
# src-extra/docutil
# src-extra/chaos src-extra/extensions src-extra/h7c \
# src-extra/chaos/extensions

# this is the list of exe files which are all compiled to check
# nothing has been broken

EXE_FILES = hssqlppp/tests/Tests \
	    hssqlppp-th/tests/TestsTh \
	    build-src/MakeDefaultTemplate1Catalog \
	build-src/PostprocessUuagc \
	examples/MakeSelect \
	examples/Parse \
	examples/Parse2 \
	examples/Parse3 \
	examples/Lex \
	examples/TypeCheck3 \
	examples/TypeCheck2 \
	examples/TypeCheck \
	examples/TypeCheckDB \
	examples/PPPTest \
	examples/QQ \
	examples/FixSqlServerTpchSyntax \
	examples/Reformat \
	examples/LexingTest
	#src-extra/chaos/chaos/BuildChaosSql

EXE_FILENAMES = $(addsuffix ".lhs",$(EXE_FILES))

#	src-extra/h7c/h7c \

#	src-extra/docutil/DevelTool

#	examples/ShowCatalog \
#	src-extra/chaos/build.lhs

BUILD = build

# the command and options used to compile .hs/.lhs to .o
HC              = @ghc
HC_BASIC_OPTS   = -Wall -threaded -rtsopts -v0
#-O2

space :=
space +=
comma := ,
HC_INCLUDE_DIRS = -i$(subst $(space),:,$(SRC_DIRS))

HC_OPTS = $(HC_BASIC_OPTS) $(HC_INCLUDE_DIRS)

# the command and options used to link .o files to an executable
HL = $(HC)
HL_OPTS = $(HC_OPTS)


# default rule: compile the main tests
build-tests : $(BUILD)/Tests

EXE_FILES_TARGETS = $(addprefix $(BUILD)/, $(notdir $(EXE_FILES)))

all : $(EXE_FILES_TARGETS)

# more all builds everything, then runs the test and then
# generates the website, then checks the sdists
more-all : all tests check-sdists
#website website-haddock

# run the tests
tests : $(BUILD)/Tests $(BUILD)/TestsTh
	$(BUILD)/Tests --hide-successes
	$(BUILD)/TestsTh --hide-successes

# make the website
#website : src-extra/docutil/DevelTool
#	src-extra/docutil/DevelTool makewebsite +RTS -N

# make the haddock and put in the correct place in the generated
# website
#website-haddock :
#	cabal configure
#	cabal haddock
#	-mkdir hssqlppp
#	-rm -Rf hssqlppp/haddock
#	mv dist/doc/html/hssqlppp hssqlppp/haddock

.PHONY : sdists
sdists :
	cd hssqlppp; cabal sdist
	cd hssqlppp-th; cabal sdist
	cd hssqlppp-pg; cabal sdist

.PHONY : check-sdists
check-sdists : sdists
	-rm -Rf /tmp/hssqlppp*
	cd hssqlppp; sh ~/.cabal/share/cabal-scripts-0.1/cabal-test dist/hssqlppp-0.5.9.tar.gz
	cd hssqlppp-th; sh ~/.cabal/share/cabal-scripts-0.1/cabal-test dist/hssqlppp-th-0.5.9.tar.gz
	cd hssqlppp-pg; sh ~/.cabal/share/cabal-scripts-0.1/cabal-test dist/hssqlppp-pg-0.5.9.tar.gz

# include the autogenerated rules

# regenerate the dependency and rules for exe compiles:
ALL_HASKELL_SOURCES := $(shell find . -type f -name '*hs')

.DELETE_ON_ERROR : autorules.mk
autorules.mk : $(ALL_HASKELL_SOURCES)
	@echo GENERATE autorules.mk
	@MakeHaskellMake --hide-package haskell2010 --hide-package haskell98 \
             --hide-package hssqlppp --hide-package hssqlppp-pg \
             --hide-package hssqlppp-th --hide-package HTF \
             $(HC_INCLUDE_DIRS) $(EXE_FILENAMES) > \
             autorules.mk
ifneq ($(findstring clean,$(MAKECMDGOALS)),clean)
-include autorules.mk
endif



# specific rules for generated file astinternal.hs
# the latest version of uuagc which I know works is 0.9.39.1
# if you get errors like this:
# error: Undefined local variable or field ...
# then try downgrading your version of uuagc (or fix the .ag code!)
AG_FILES = $(shell find hssqlppp/src -iname '*ag')

# the dependency on build-src/PostprocessUuagc.lhs isn't quite right
# want to depend on build-src/PostprocessUuagc.lhs and all its
# other dependencies as source files as well
# don't want to depend on the exe since this causes build problems
# with cyclic dependencies and with rebuilding stuff too often

hssqlppp/src/Database/HsSqlPpp/Internals/AstInternal.hs : $(AG_FILES) build-src/PostprocessUuagc.lhs
	@if ! uuagc --version | grep 0.9.39.1 > /dev/zero ; then \
		echo "Install uuagc dependencies: cabal install uuagc-bootstrap uuagc-cabal" ; \
		echo "Then download uuagc-0.9.39.1 from http://hackage.haskell.org/package/uuagc-0.9.39.1" ; \
		exit 1 ; \
	fi
	uuagc -dcfspwm -P hssqlppp/src/Database/HsSqlPpp/Internals/ \
		--lckeywords --doublecolons --genlinepragmas \
		hssqlppp/src/Database/HsSqlPpp/Internals/AstInternal.ag
	make $(BUILD)/PostprocessUuagc
	$(BUILD)/PostprocessUuagc


#-dcfspwm --cycle -O
# rule for the generated file
# src/Database/HsSqlPpp/Internals/Catalog/DefaultTemplate1Catalog.lhs
# don't want to automatically keep this up to date, only regenerate it
# manually

.PHONY : regenDefaultTemplate1Catalog
regenDefaultTemplate1Catalog : $(BUILD)/MakeDefaultTemplate1Catalog
	$(BUILD)/MakeDefaultTemplate1Catalog > \
		hssqlppp/src/Database/HsSqlPpp/Internals/Catalog/DefaultTemplate1Catalog.lhs_new
	mv hssqlppp/src/Database/HsSqlPpp/Internals/Catalog/DefaultTemplate1Catalog.lhs_new \
		hssqlppp/src/Database/HsSqlPpp/Internals/Catalog/DefaultTemplate1Catalog.lhs


.PHONY : clean
clean :
	-rm -Rf hssqlppp/dist
	-rm -Rf hssqlppp-pg/dist
	-rm -Rf hssqlppp-th/dist
	-rm -Rf build

# TODO: find something better than Make
