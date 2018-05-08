#
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Tuesday, May  8 15:07:43 CEST 2018
# version : 0.0.1
#


where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(E3_REQUIRE_TOOLS)/driver.makefile

ifneq ($(strip $(ASYN_DEP_VERSION)),)
asyn_VERSION=$(ASYN_DEP_VERSION)
endif

ifneq ($(strip $(MOTOR_DEP_VERSION)),)
motor_VERSION=$(MOTOR_DEP_VERSION)
endif



APP:=EthercatMCApp
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src


USR_INCLUDES += -I$(where_am_I)/$(APPSRC)

# USR_CFLAGS   += -Wno-unused-variable
# USR_CFLAGS   += -Wno-unused-function
# USR_CFLAGS   += -Wno-unused-but-set-variable
# USR_CPPFLAGS += -Wno-unused-variable
# USR_CPPFLAGS += -Wno-unused-function
# USR_CPPFLAGS += -Wno-unused-but-set-variable

TEMPLATES += $(APPDB)/EthercatMC.template
TEMPLATES += $(APPDB)/EthercatMCdebug.template
TEMPLATES += $(APPDB)/EthercatMChome.template


SOURCES += $(APPSRC)/EthercatMCAxis.cpp
SOURCES += $(APPSRC)/EthercatMCController.cpp 
SOURCES += $(APPSRC)/EthercatMCHelper.cpp 

DBD += $(APPSRC)/devEthercatMC.dbd

# db rule is the default in RULES_E3, so add the empty one

db:
