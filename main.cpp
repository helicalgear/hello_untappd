#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDateTime>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QDateTime local = QDateTime::currentDateTime();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("ClientId", ID);
    engine.rootContext()->setContextProperty("ClientSecret", SECRET);
    engine.rootContext()->setContextProperty("RedirectUrl", URL);
    engine.rootContext()->setContextProperty("timeZone", local.timeZoneAbbreviation());
    engine.rootContext()->setContextProperty("tzOffset", local.offsetFromUtc() / 3600);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
