#include "mainwindow.h"
#include <QApplication>
#include "../MySharedLibrary/mysharedlibrary.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();

    Q_INIT_RESOURCE(mystaticlibrary);
    MySharedLibrary::InitResources();

    return a.exec();
}
