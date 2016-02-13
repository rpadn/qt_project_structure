include(app_dependencies.pri)
include(../../project.pri)

TEMPLATE = app

QT += core gui widgets

DESTDIR = $$IDE_BIN_PATH
INCLUDEPATH += $$MODULES_DIR

SOURCES += main.cpp
