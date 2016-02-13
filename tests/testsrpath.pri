linux-* {
    QMAKE_RPATHDIR += $$IDE_BIN_PATH
    IDE_BIN_RPATH = $$join(QMAKE_RPATHDIR, ":")
    QMAKE_LFLAGS += -Wl,-z,origin \'-Wl,-rpath,$${IDE_BIN_RPATH}\'
} else:macx {
    QMAKE_LFLAGS += -Wl,-rpath,\"$$IDE_BIN_PATH/../\"
}
