#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QMessageBox>

using namespace std::placeholders;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_RequestPermissionButton_clicked()
{
    if(QtAndroid::androidSdkVersion() >= 23)
    {
        const QString PermissionID("android.permission.READ_EXTERNAL_STORAGE");

        if(QtAndroid::checkPermission(PermissionID) != QtAndroid::PermissionResult::Granted)
        {
            if(QtAndroid::shouldShowRequestPermissionRationale(PermissionID))
            {
                QMessageBox::information(this, "Info", "Please, this permission is requested for bla bla bla");
            }
            QtAndroid::requestPermissions(QStringList() << PermissionID, std::bind(&MainWindow::RequestPermissionsResults, this, _1));
            return;
        }

        QMessageBox::information(this, "Info", "Permission is already granted");
    }
}

void MainWindow::RequestPermissionsResults(const QtAndroid::PermissionResultMap &ResultMap)
{
    if(ResultMap["android.permission.READ_EXTERNAL_STORAGE"] == QtAndroid::PermissionResult::Granted)
        QMessageBox::information(this, "Info", "Permission granted!");
    else
        QMessageBox::warning(this, "Error", "Permission denied!");
}
