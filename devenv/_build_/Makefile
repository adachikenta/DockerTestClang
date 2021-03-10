PathRoot:=..
MAIN := application
MAINDIR := $(PathRoot)/$(MAIN)
MODULES  = library1 library2
SUBDIRS := $(MODULES:%=$(PathRoot)/%)

.PHONY: all $(SUBDIRS) clean

all: $(SUBDIRS)
	@echo ""
	@echo "<<<< $(MAIN) >>>>"
	@$(MAKE) --no-print-directory -C $(MAINDIR)

$(SUBDIRS):
	@echo ""
	@echo "<<<<" $(notdir $@) ">>>>"
	@$(MAKE) --no-print-directory -C $@

clean:
	@dirs='$(SUBDIRS)'; for dir in $$dirs; do echo ; echo $$dir; $(MAKE) clean --no-print-directory -C $$dir; done
	@echo ; echo $(MAINDIR); $(MAKE) clean --no-print-directory -C $(MAINDIR)
