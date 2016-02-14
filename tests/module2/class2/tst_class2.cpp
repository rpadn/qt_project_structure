#include <QtTest/QtTest>
#include <module2/class2.h>

#include <module2/class2private.h>

class tst_Class2: public QObject
{
    Q_OBJECT
private slots:
    void notEmptyOnCreation();
    void classNotExportedMethod();
};

void tst_Class2::notEmptyOnCreation()
{
    Class2 cl2;

    QCOMPARE(cl2.string(), QString("aString"));
}

void tst_Class2::classNotExportedMethod()
{
    Class2Private cl2p;

    QCOMPARE(cl2p.counter(), 1);
}

QTEST_MAIN(tst_Class2)
#include "tst_class2.moc"
