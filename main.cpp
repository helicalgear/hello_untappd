#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("ClientId", ID);
    engine.rootContext()->setContextProperty("ClientSecret", SECRET);
    engine.rootContext()->setContextProperty("RedirectUrl", URL);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
