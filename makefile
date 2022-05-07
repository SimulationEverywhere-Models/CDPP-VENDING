.SUFFIXES : .cpp .o .c .y

CPP=g++
CC=gcc
AR=ar
YACPP=yacc

DEFINES_CPP=

#============================================================================
# Optimized Code - Requires more virtual memory.
OPTCPPFLAGS=-O3
#----------------------
# Not optimized
#OPTCPPFLAGS=
#============================================================================

# gcc < 2.8.x 
#DEFINES_CPP=-D_G_NO_EXTERN_TEMPLATES
#CPPFLAGS=-fhandle-exceptions 


#============================================================================
# gcc 2.8.x (y superiores):
# -------------------------
# Ver warnings:
CPPFLAGS += -Wall
# Ignorar warnings:
#CPPFLAGS += -w

# Include information for GDB:
#CPPFLAGS += -g

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# The next flag must be actived ONLY if we are compiling under Windows 95 !!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#CPPFLAGS += -D__WINDOWS__
#============================================================================



DEFINES_C=


# If we are compiling for Unix
INCLUDES_CPP=-I/usr/include
# or if we are compiling for Windows 95
#INCLUDES_CPP=


INCLUDES_C=
CFLAGS=
DEBUGFLAGS=
LDFLAGS += -L. -g 

# if we are compiling for Windows 95, comment the last two lines



EXAMPLESOBJS= item_processor.o service_panel.o queue.o main.o generat.o cpu.o transduc.o trafico.o distri.o com.o linpack.o debug.o coin_collector.o register.o balance_display.o change_maker.o item_selector.o message_queue.o central_controller.o vending_controller.o service_controller.o
LIBNAME=simu
LIBS=-lsimu
ALLOBJS=${EXAMPLESOBJS} ${SIMOBJS} 
INIOBJS=initest.o ini.o
ALLSRCS=${ALLOBJS:.o=.cpp} gram.y 

all: simu

libs: libsimu.a

simu: ${ALLOBJS}  libsimu.a
	g++ ${LDFLAGS} -o $@ ${EXAMPLESOBJS} ${LIBS}

initest: ${INIOBJS} 
	${CPP} ${LDFLAGS} -o $@ ${INIOBJS} 

drawlog: drawlog.o libsimu.a
	g++ ${LDFLAGS} -o $@ drawlog.o ${LIBS}

makerand: makerand.o libsimu.a
	g++ ${LDFLAGS} -o $@ makerand.o ${LIBS}

toMap: toMap.o libsimu.a
	g++ ${LDFLAGS} -o $@ toMap.o ${LIBS}

toCDPP: toCDPP.o libsimu.a
	g++ ${LDFLAGS} -o $@ toCDPP.o ${LIBS}

randEvent: randEvent.o libsimu.a
	g++ ${LDFLAGS} -o $@ randEvent.o ${EXAMPLESOBJS} ${LIBS}

exptest: synnode.o
	g++ ${LDFLAGS} -o $@ synnode.o
	
parser: parser.o gram.o
	g++ ${LDFLAGS} -o $@ parser.o gram.o

libsimu.a: ${SIMOBJS}
	${AR} crs lib${LIBNAME}.a ${SIMOBJS}

clean:
	- rm -f *.o *.a simu core drawlog initest exptest parser makerand toMap

depend:
	makedepend -Y ${ALLSRCS}

backup:
	tar -cvf simu.tar *.cpp *.h *.c *.y makefile* *.ma *.ev *.vpj *.bat *.txt *.val *.inc *.map; gzip simu.tar; mv simu.tar.gz simu.tgz

########################
# Without Optimization
item_processor.o: item_processor.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

service_panel.o: service_panel.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

coin_collector.o: coin_collector.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

balance_display.o: balance_display.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

change_maker.o: change_maker.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

item_selector.o: item_selector.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

message_queue.o: message_queue.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

central_controller.o: central_controller.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

vending_controller.o: vending_controller.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

service_controller.o: service_controller.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

generat.o: generat.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

queue.o: queue.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

cpu.o: cpu.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

transduc.o: transduc.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

trafico.o: trafico.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

register.o: register.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

msgadm.o: msgadm.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

root.o: root.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

parser.o: parser.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

main.o: main.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

drawlog.o: drawlog.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

toMap.o: toMap.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

toCDPP.o: toCDPP.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

makerand.o: makerand.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

mainsimu.o: mainsimu.cpp
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<

# Uncomment these lines only for Windows
#macroexp.o: macroexp.cpp
#	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<
#
#flatcoup.o: flatcoup.cpp
#	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} $<
########################

.cpp.o:
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} ${OPTCPPFLAGS} $<

.c.o:
	${CC} -c ${INCLUDES_C} ${DEFINES_C}  ${DEBUGFLAGS} ${CFLAGS} ${OPTCPPFLAGS} $<

.y.o:
	bison -d -v -o gram.c gram.y
	${CPP} -c ${INCLUDES_CPP} ${DEFINES_CPP} ${DEBUGFLAGS} ${CPPFLAGS} ${OPTCPPFLAGS} ${@:.o=.c} 
	rm $*.c
	
# DO NOT DELETE

queue.o: queue.h atomic.h model.h port.h modelid.h time.h portlist.h real.h
queue.o: undefd.h impresion.h tbool.h except.h stringp.h value.h evaldeb.h
queue.o: cellpos.h ntupla.h procadm.h process.h message.h strutil.h
queue.o: mainsimu.h root.h event.h ini.h loader.h ltranadm.h
main.o: stdaload.h loader.h time.h evaldeb.h macroexp.h except.h stringp.h
main.o: netload.h mainsimu.h root.h event.h real.h undefd.h impresion.h
main.o: tbool.h value.h port.h modelid.h process.h procadm.h ini.h ltranadm.h
main.o: cellpos.h ntupla.h portlist.h model.h
generat.o: generat.h atomic.h model.h port.h modelid.h time.h portlist.h
generat.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
generat.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
generat.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
generat.o: distri.h
cpu.o: cpu.h atomic.h model.h port.h modelid.h time.h portlist.h real.h
cpu.o: undefd.h impresion.h tbool.h except.h stringp.h value.h evaldeb.h
cpu.o: cellpos.h ntupla.h procadm.h process.h message.h strutil.h distri.h
cpu.o: mainsimu.h root.h event.h ini.h loader.h ltranadm.h
transduc.o: transduc.h atomic.h model.h port.h modelid.h time.h portlist.h
transduc.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
transduc.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
transduc.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
trafico.o: time.h trafico.h atomic.h model.h port.h modelid.h portlist.h
trafico.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
trafico.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
trafico.o: strutil.h
distri.o: time.h distri.h except.h stringp.h strutil.h real.h undefd.h
distri.o: impresion.h tbool.h value.h evaldeb.h
debug.o: debug.h tdcell.h atomcell.h portlist.h real.h undefd.h impresion.h
debug.o: tbool.h except.h stringp.h value.h evaldeb.h port.h modelid.h
debug.o: cellpos.h ntupla.h atomic.h model.h time.h procadm.h process.h
debug.o: neighval.h mylist.h coupcell.h coupled.h ltranadm.h cellstate.h
register.o: modeladm.h mainsimu.h root.h event.h time.h real.h undefd.h
register.o: impresion.h tbool.h except.h stringp.h value.h evaldeb.h port.h
register.o: modelid.h process.h procadm.h ini.h loader.h ltranadm.h cellpos.h
register.o: ntupla.h portlist.h model.h queue.h atomic.h generat.h cpu.h
register.o: transduc.h message.h strutil.h trafico.h
gram.o: synnode.h tbool.h except.h stringp.h real.h undefd.h impresion.h
gram.o: value.h evaldeb.h realfunc.h ltranadm.h cellpos.h ntupla.h portlist.h
gram.o: port.h modelid.h time.h model.h procadm.h process.h parser.h
coin_collector.o: coin_collector.h atomic.h model.h port.h modelid.h time.h portlist.h
coin_collector.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
coin_collector.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
coin_collector.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
balance_display.o: balance_display.h atomic.h model.h port.h modelid.h time.h portlist.h
balance_display.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
balance_display.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
balance_display.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
change_maker.o: change_maker.h atomic.h model.h port.h modelid.h time.h portlist.h
change_maker.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
change_maker.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
change_maker.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
item_selector.o: item_selector.h atomic.h model.h port.h modelid.h time.h portlist.h
item_selector.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
item_selector.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
item_selector.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
message_queue.o: message_queue.h atomic.h model.h port.h modelid.h time.h portlist.h
message_queue.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
message_queue.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
message_queue.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
central_controller.o: central_controller.h atomic.h model.h port.h modelid.h time.h portlist.h
central_controller.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
central_controller.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
central_controller.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
item_processor.o: item_processor.h atomic.h model.h port.h modelid.h time.h portlist.h
item_processor.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
item_processor.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
item_processor.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
service_panel.o: service_panel.h atomic.h model.h port.h modelid.h time.h portlist.h
service_panel.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
service_panel.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
service_panel.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
vending_controller.o: vending_controller.h atomic.h model.h port.h modelid.h time.h portlist.h
vending_controller.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
vending_controller.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
vending_controller.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
service_controller.o: service_controller.h atomic.h model.h port.h modelid.h time.h portlist.h
service_controller.o: real.h undefd.h impresion.h tbool.h except.h stringp.h value.h
service_controller.o: evaldeb.h cellpos.h ntupla.h procadm.h process.h message.h
service_controller.o: strutil.h mainsimu.h root.h event.h ini.h loader.h ltranadm.h
 