export TARGET=macosx:clang
ARCHS = x86_64
ADDITIONAL_CFLAGS = -fobjc-arc

# Disable dpkg
override PACKAGE_FORMAT := none

include $(THEOS)/makefiles/common.mk

TOOL_NAME = SimpleInjector
SimpleInjector_FILES = main.m task_vaccine/task_vaccine.c
SimpleInjector_FRAMEWORKS = AppKit
SimpleInjector_OBJ_FILES = task_vaccine/build/x86_64/task_vaccine.a

include $(THEOS_MAKE_PATH)/tool.mk

MAKEFILE_DIR := $(CURDIR)/$(dirname $(lastword $(MAKEFILE_LIST)))

task_vaccine/build/x86_64/task_vaccine.a:
	cd $(MAKEFILE_DIR)/task_vaccine; rake static_64

clean::
	cd $(MAKEFILE_DIR)/task_vaccine; rake clear
