#
# config.mak
#

TARGET = __TARGET__

COMMON_CONFIG += CFLAGS="-g0 -Os" CXXFLAGS="-g0 -Os" LDFLAGS="-s"

ifdef $(NATIVE)
COMMON_CONFIG += CC="__TARGET__-gcc -static --static" CXX="__TARGET__-g++ -static --static"
endif