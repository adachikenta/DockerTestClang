.PHONY: clean

ifneq ($(findstring $(MAKECMDGOALS),$(origin clean)),)
-include $(DEPS)
endif

define common-rule-core
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@rm -f $@
endef
define common-rule
    @echo ------------------------------------------------------------------------------------------------------------------------
	@echo creating $(notdir $@) "<-------" depends on $(notdir $?)
	@$(call common-rule-core)
endef

ifeq ($(Module),application)
$(OUT): $(OBJS) $(ARCS)
	$(call common-rule)
	$(LD) $(FLAGS_CC) -Wl,-Map=$(MAP) $(LIBS) $^ $(OUTPUT_OPTION)
else
$(ARC): $(OBJS)
	$(call common-rule)
	$(AR) $@ $^
endif

$(OBJS): $(OBJDIR)/%.o: %.c $(OBJDIR)/%.d
	$(call common-rule)
	$(CC) $(FLAGS_CC) $(FLAGS_DEFINE) $(FLAGS_INCLUDE) -c $< $(OUTPUT_OPTION)

$(DEPS): $(OBJDIR)/%.d: %.c $(MAKEFILE_LIST)
	@$(call common-rule-core)
	@$(CC) -MM $(FLAGS_CC) $(FLAGS_DEFINE) $(FLAGS_INCLUDE) -c $< | sed -e 's%$*.o%$(dir $@)$*.o $@%' > $@

clean:
	@echo "    cleaning output file..."; ls $(OUTPUTS) 2>/dev/null | sort | sed 's/^/\t/' | tee clean.log; rm -f $(OUTPUTS)
