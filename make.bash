#!/bin/bash

#1 - demo.i
gcc -E -x c sncProgram.st >demo.i

#2 - demo.c
${HOME}/epics_env/epics-modules/seq/bin/linux-x86_64/snc +m demo.i

#3 - demo.o
gcc -I. -I.. \
-I${HOME}/epics_env/epics-modules/seq/include \
-I${HOME}/epics_env/epics-base/include \
-I${HOME}/epics_env/epics-base/include/compiler/gcc \
-I${HOME}/epics_env/epics-base/include/os/Linux \
-c demo.c

#4 - demo
g++ -o demo demo.o -rdynamic -m64 \
-L${HOME}/epics_env/epics-base/lib/linux-x86_64 \
-L${HOME}/epics_env/epics-modules/seq/lib/linux-x86_64 \
-Wl,-rpath,${HOME}/epics_env/epics-base/lib/linux-x86_64 \
-Wl,-rpath,${HOME}/epics_env/epics-modules/seq/lib/linux-x86_64 \
-lseq -lpv -lqsrv -lpvAccessIOC -lpvAccessCA -lpvAccess -lpvData -ldbRecStd -ldbCore -lca -lCom
