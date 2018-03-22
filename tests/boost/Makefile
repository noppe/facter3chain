include ../../common

all: compile run

compile: boost_log.cpp
	g++ -std=c++11 -I ${PREFIX}/include/ -L${PREFIX}/lib/ -Wl,-rpath=${PREFIX}/lib/ -DBOOST_LOG_DYN_LINK -lboost_log  -lboost_thread -pthread boost_log.cpp -o test_boost

run: test_boost
	./test_boost
	
