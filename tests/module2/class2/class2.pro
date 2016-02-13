MODULE_DEPENDS += module2
QT = core
include(../../tests.pri)

MODULE2DIR = $$MODULES_DIR/module2

# on linux this is not necessary: class2private is visible. Maybe is a Winzoz
# limit?
INCLUDEPATH += $$MODULE2DIR

SOURCES += tst_class2.cpp \
    $$MODULE2DIR/class2private.cpp
