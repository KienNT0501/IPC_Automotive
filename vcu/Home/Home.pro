QT += core quick multimedia gui xml
CONFIG += c++11

DEFINES += PROJECT_PATH=\"\\\"$${_PRO_FILE_PWD_}/\\\"\"


SOURCES += \
    main.cpp \
    App/Media/translator/src/translator.cpp \
    App/Media/core/player/player.cpp \
    App/Media/core/playlist/playlist.cpp \
    HomeScreen/core/model/applicationmodel.cpp \
    HomeScreen/core/xml/reader/xmlreader.cpp \
    HomeScreen/core/xml/writer/xmlwriter.cpp \

RESOURCES += \
    rsc/Image.qrc \
    rsc/qml.qrc \
    rsc/xml.qrc \

HEADERS += \
    App/Media/translator/src/translator.h \
    App/Media/core/player/player.h \
    App/Media/core/playlist/playlist.h \
    HomeScreen/core/model/applicationmodel.h \
    HomeScreen/core/xml/reader/xmlreader.h \
    HomeScreen/core/xml/writer/xmlwriter.h \

TRANSLATIONS += App/Media/translator/ts/translate_vn.ts \
                App/Media/translator/ts/translate_us.ts \

unix {
    system(lrelease App/Media/translator/ts/translate_vn.ts)
    system(lrelease App/Media/translator/ts/translate_us.ts)
}

LIBS += -ltag

DISTFILES += \
    HomeScreen/core/xml/application.xml \
