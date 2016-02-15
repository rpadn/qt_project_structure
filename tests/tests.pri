include(../project.pri)
include(testsrpath.pri)

isEmpty(TEMPLATE):TEMPLATE = app
QT += testlib
CONFIG += testcase
CONFIG -= app_bundle

# prefix test binary with tst_
!contains(TARGET, ^tst_.*):TARGET = $$join(TARGET,,"tst_")

OBJECTS_DIR = $${OUT_PWD}/obj
MOC_DIR = $${OUT_PWD}/obj
RCC_DIR = $${OUT_PWD}/obj
UI_DIR = $${OUT_PWD}/obj

INCLUDEPATH += $$MODULES_DIR

# Needed to run tst_*.exe: updates PATH env variable in order to find libs
# during make check.
win32 {
    lib = $$IDE_BIN_PATH;
    lib ~= s,/,\\,g
    # the below gets added to later by testcase.prf
    check.commands = cd . & set PATH=$$lib;%PATH%& cmd /c
}
