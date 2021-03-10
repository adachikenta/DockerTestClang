OBJDIR   =$(PathRoot)/_build_/obj/$(Module)
OBJLDIR  =$(PathRoot)/_build_/obj/objlink
OBJS    :=$(addprefix $(OBJDIR)/, $(SRCS:%.c=%.o))
DEPS    :=$(addprefix $(OBJDIR)/, $(SRCS:%.c=%.d))
OUTPUTS  =$(OBJS) $(DEPS)

ifeq ($(Module),application)
OUT     :=$(PathRoot)/_build_/$(Module)
MAP     :=$(PathRoot)/_build_/$(Module).map
OBJLINKS:= library1 library2
ARCS    :=$(addprefix $(OBJLDIR)/, $(OBJLINKS:%=%.a))
OUTPUTS +=$(OUT) $(MAP)
else
ARC     :=$(OBJLDIR)/$(Module).a
OUTPUTS +=$(ARC)
endif
