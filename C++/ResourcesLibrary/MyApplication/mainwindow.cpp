#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->iconStaticLibrary->setPixmap(QPixmap(":/MyStaticLibraryResources/qt_icon.png"));
    ui->iconSharedLibrary->setPixmap(QPixmap(":/MySharedLibraryResources/qt_icon.png"));
}

MainWindow::~MainWindow()
{
    delete ui;
}
