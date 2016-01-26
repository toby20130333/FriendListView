#include "widget.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Widget w(Qt::WindowStaysOnTopHint);
//    w.show();
    w.showQML();

    return a.exec();
}
