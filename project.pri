!isEmpty(PROJECT_PRI_INCLUDED):error("project.pri already included")
PROJECT_PRI_INCLUDED = 1

defineReplace(libraryName) {
   unset(LIBRARY_NAME)
   LIBRARY_NAME = $$1
   CONFIG(debug, debug|release) {
      !debug_and_release|build_pass {
          mac:RET = $$member(LIBRARY_NAME, 0)_debug
          else:win32:RET = $$member(LIBRARY_NAME, 0)d
      }
   }
   isEmpty(RET):RET = $$LIBRARY_NAME
   return($$RET)
}

IDE_SOURCE_TREE = $$PWD
IDE_BIN_PATH = $$IDE_SOURCE_TREE/bin/
MODULES_DIR = $$IDE_SOURCE_TREE/src/

!isEmpty(MODULE_DEPENDS) {
    LIBS *= -L$$IDE_BIN_PATH
}

# recursively resolve modules deps
done_modules =
for(ever) {
    isEmpty(MODULE_DEPENDS): \
        break()
    done_modules += $$MODULE_DEPENDS
    for(dep, MODULE_DEPENDS) {
        dependencies_file =
        for(dir, MODULES_DIR) {
            exists($$dir/$$dep/$${dep}_dependencies.pri) {
                dependencies_file = $$dir/$$dep/$${dep}_dependencies.pri
                break()
            }
        }
        isEmpty(dependencies_file): \
            error("Module dependency $$dep not found")
        include($$dependencies_file)
        LIBS += -l$$libraryName($$MODULE_NAME)
    }
    MODULE_DEPENDS = $$unique(MODULE_DEPENDS)
    MODULE_DEPENDS -= $$unique(done_modules)
}
