include(../project.pri)

TEMPLATE = subdirs

SUBDIRS = module1 \
          module2 \
          app

for(p, SUBDIRS) {
    MODULE_DEPENDS =
    include($$p/$${p}_dependencies.pri)
    pv = $${p}.depends
    $$pv = $$MODULE_DEPENDS
}
