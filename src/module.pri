depfile = $$replace(_PRO_FILE_PWD_, ([^/]+$), \\1/\\1_dependencies.pri)
exists($$depfile) {
    include($$depfile)
    isEmpty(MODULE_NAME): \
        error("$$basename(depfile) does not define MODULE_NAME.")
} else {
    isEmpty(MODULE_NAME): \
        error("MODULE_NAME is empty. Maybe you meant to create $$basename(depfile)?")
}

TARGET = $$MODULE_NAME

CONFIG += static_and_shared build_all

include(../project.pri)

isEmpty(TARGET) {
    error("module.pri: You must provide a TARGET")
}
TARGET = $$libraryName($$TARGET)

QT += core

TEMPLATE = lib
DESTDIR = $$IDE_BIN_PATH

LIBS += -L$$DESTDIR
INCLUDEPATH += $$OUT_PWD

OBJECTS_DIR = $${OUT_PWD}/obj
MOC_DIR = $${OUT_PWD}/obj
RCC_DIR = $${OUT_PWD}/obj
UI_DIR = $${OUT_PWD}/obj
