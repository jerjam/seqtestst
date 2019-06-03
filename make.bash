#!/bin/bash


gcc -E -x c sncProgram.st >demo.i

/home/jerzy/epics_env/epics-modules/seq/bin/linux-x86_64/snc +m demo.i

gcc -D_POSIX_C_SOURCE=199506L -D_POSIX_THREADS -D_REENTRANT \
-D__EXTENSIONS__ -DnoExceptionsFromCXX \
-DOSITHREAD_USE_DEFAULT_STACK \
-I. -I.. \
-I/usr/local/epics/seq/include \
-I/usr/local/epics/base/include \
-I/home/jerzy/epics_env/epics-modules/seq/include \
-I/home/jerzy/epics_env/epics-base/include \
-I/home/jerzy/epics_env/epics-base/include/compiler/gcc \
-I/home/jerzy/epics_env/epics-base/include/os/Linux \
-c demo.c


#g++ -o demo \
#demo.o -lseq -lpv -lpvCa -lca -lCom \
#-lposix4 -lpthread -lthread -lsocket -lnsl -lm


g++ -o demo \
-L/home/jerzy/epics_env/epics-modules/seq/lib/linux-x86_64 \
-L/home/jerzy/epics_env/epics-base/lib/linux-x86_64 \
demo.o -lseq -lpv -lpvCa -lca -lCom \
-lposix4 -lpthread -lthread -lsocket -lnsl -lm

#g++ -o demo \
#-L/home/jerzy/epics_env/epics-modules/seq/lib/linux-x86_64 \
#-L/home/jerzy/epics_env/epics-base/lib/linux-x86_64 \
#demo.o -lseq -lpv -lca -lCom \
#-lpthread -lthread -lsocket -lnsl -lm
