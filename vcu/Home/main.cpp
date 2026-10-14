#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include "App/Media/translator/src/translator.h"
#include "App/Media/core/player/player.h"
#include "HomeScreen/core/model/applicationmodel.h"
#include "HomeScreen/core/xml/reader/xmlreader.h"
#include "HomeScreen/core/xml/writer/xmlwriter.h"
int main(int argc, char *argv[])
{


    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext *rootContext = engine.rootContext();

    Player controller;
    Translator translator;
    ApplicationModel appModel;

    xmlReader xmlReader("HomeScreen/core/xml/application.xml", appModel);
    xmlWriter xmlWriter("HomeScreen/core/xml/application.xml", appModel);

    // Initialize ClimateWrapper and expose it to QML
    rootContext->setContextProperty("Playlist", controller.playlist);
    rootContext->setContextProperty("PlaylistModel",controller.playlistModel);
    rootContext->setContextProperty("Player",&controller);
    rootContext->setContextProperty("translator",&translator);
    rootContext->setContextProperty("AppModel",&appModel);
    const QUrl url(QStringLiteral("qrc:/HomeScreen/ui/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
