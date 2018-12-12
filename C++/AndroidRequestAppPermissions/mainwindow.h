#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtAndroidExtras>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_RequestPermissionButton_clicked();

private:
    Ui::MainWindow *ui;
    void RequestPermissionsResults(const QtAndroid::PermissionResultMap &ResultMap);
};

#endif // MAINWINDOW_H
