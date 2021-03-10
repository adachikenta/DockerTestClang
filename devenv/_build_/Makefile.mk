include $(PathRoot)/_build_/MakefileTool.mk
include $(PathRoot)/_build_/MakefileOption.mk
ifeq ($(Module),application)
include $(PathRoot)/_build_/MakefileLibs.mk
endif
include $(PathRoot)/_build_/MakefileDefine.mk
include $(PathRoot)/_build_/MakefileInclude.mk
include $(PathRoot)/_build_/MakefileOutput.mk
include $(PathRoot)/_build_/MakefileRule.mk
