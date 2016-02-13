#include <QApplication>
#include <module2/class2.h>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    Class2 cl2;
    qDebug() << cl2.string();

    return 0;
}
