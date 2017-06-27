#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDateTime>
#include <QLocale>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QDateTime local = QDateTime::currentDateTime();
    QLocale ms;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("clientId", ID);
    engine.rootContext()->setContextProperty("clientSecret", SECRET);
    engine.rootContext()->setContextProperty("redirectUrl", URL);
    engine.rootContext()->setContextProperty("fsClientId", FS_ID);
    engine.rootContext()->setContextProperty("fsClientSecret", FS_SECRET);
    engine.rootContext()->setContextProperty("fsVersion", FS_VERSION);
    engine.rootContext()->setContextProperty("timeZone", local.timeZoneAbbreviation());
    engine.rootContext()->setContextProperty("tzOffset", local.offsetFromUtc()/3600);
    if ( ms.measurementSystem() == 0 ) {
        engine.rootContext()->setContextProperty("distPref", "km");
    } else {
        engine.rootContext()->setContextProperty("distPref", "m");
    }
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
