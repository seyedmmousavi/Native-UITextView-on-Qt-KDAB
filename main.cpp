#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "mytextview.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<MyTextView>("MyTextView", 1, 0, "MyTextView");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
