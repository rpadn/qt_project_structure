#include <QtTest/QtTest>
#include <module1/class1.h>

class tst_Class1: public QObject
{
    Q_OBJECT
private slots:
    void zeroOnCreation();
};

void tst_Class1::zeroOnCreation()
{
    Class1 c1;
    QCOMPARE(c1.number(), 0);
}

QTEST_MAIN(tst_Class1)
#include "tst_class1.moc"
