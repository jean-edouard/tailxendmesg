##############################
# Complete this to make it ! #
##############################
NAME 	= tailxendmesg		# Name of executable file
SRC	= main.c		# List of *.c
INCL  	=		# List of *.h
################
# Optional add #
################
IPATH   ?= -I.           # path of include file
OBJOPT  ?= -O2 -Wall -Wstrict-prototypes       # option for obj
EXEOPT  ?= -O2 -Wall -Wstrict-prototypes       # option for exe (-lefence ...)
LPATH   ?= -L.           # path for librairies ... 

#####################
# Macro Definitions #
#####################
CC 	?= gcc
CXX 	?= g++
MAKE 	?= make
SHELL	?= /bin/sh
OBJS 	?= $(SRC:.c=.o) 	# WARNING!!! Be careful of your file extensions.
RM 	?= /bin/rm -f 	
COMP	?= gzip -9v
UNCOMP	?= gzip -df
STRIP	?= strip

CFLAGS  ?= $(OBJOPT) $(IPATH)
LDFLAGS ?= $(EXEOPT) $(LPATH)

BINDIR  ?= /usr/bin

.SUFFIXES: .h.Z .c.Z .h.gz .c.gz .c.z .h.z 

##############################
# Basic Compile Instructions #
##############################

all:	$(NAME)
$(NAME): $(OBJS) $(SRC) $(INCL)  
	$(CC) $(OBJS) $(LDFLAGS) -o $(NAME) 
#	$(STRIP) ./$(NAME) # if you debug ,don't strip ...

install:
	install -m 0755 -d $(DESTDIR)/$(BINDIR)
	install -m 0755 $(NAME) $(DESTDIR)/$(BINDIR)/$(NAME)

depend:
	gcc $(IPATH) -MM $(SRC) 
clean:
	-$(RM) $(NAME) $(OBJS) *~
fclean:
	-$(RM) $(NAME)
comp: clean
	$(COMP) $(INCL) $(SRC)
ucomp: 
	$(UNCOMP) $(SRC) $(INCL)

.c.Z.c .h.Z.h .c.gz.c .h.gz.h .c.z.c .h.z.h :
	 -$(UNCOMP) $<

.c.o:
	$(CC) $(CFLAGS) -c $< 
.cc.o:
	$(CXX) $(CFLAGS) -c $< 
################
# Dependencies #
################
