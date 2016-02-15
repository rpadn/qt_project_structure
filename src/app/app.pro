include(app_dependencies.pri)
include(../../project.pri)

TEMPLATE = app

QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

DESTDIR = $$IDE_BIN_PATH
INCLUDEPATH += $$MODULES_DIR

SOURCES += main.cpp
