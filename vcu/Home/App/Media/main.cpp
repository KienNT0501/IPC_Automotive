#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include "translator/src/translator.h"
#include "core/playlist/playlist.h"
#include "core/player/player.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext *rootContext = engine.rootContext();
    Player controller;
    Translator translator;

    rootContext->setContextProperty("PlaylistModel",controller.playlistModel);

    rootContext->setContextProperty("player",&controller);

    rootContext->setContextProperty("translator",&translator);

    const QUrl url(QStringLiteral("qrc:/ui/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
