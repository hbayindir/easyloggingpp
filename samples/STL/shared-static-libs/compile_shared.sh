rm -rf libmyLib.so lib/libmyLib.so lib/mylib.o lib/myLib.a myLib.a myapp logs ## Clean

compiler=g++
standard=c++0x ## If this does not work try c++11 (depends on your compiler)
macros="-DELPP_THREAD_SAFE -DELPP_FEATURE_CRASH_LOG"  ## Macros for library

cd lib/
$compiler --std=$standard -pipe -fPIC -g -O0  $macros  -Iinclude  -c -o mylib.o mylib.cpp
$compiler -fPIC -g  -shared -o libmyLib.so mylib.o
cp libmyLib.so ..
cd ..
$compiler -g -std=$standard -fPIC -pipe  -L lib myapp.cpp -Ilib/include -lmyLib  -o myapp
