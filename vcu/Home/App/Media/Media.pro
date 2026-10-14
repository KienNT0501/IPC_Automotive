QT+= core quick multimedia gui

CONFIG += c++11

SOURCES += \
    main.cpp \
    translator/src/translator.cpp \
    core/playlist/playlist.cpp \
    core/player/player.cpp \

RESOURCES += \
    rsc_mda/mda_img.qrc \
    rsc_mda/mda_qml.qrc \


HEADERS += \
    translator/src/translator.h \
    core/playlist/playlist.h \
    core/player/player.h \

TRANSLATIONS += translator/ts/translate_vn.ts \
                translator/ts/translate_us.ts \

unix {
    system(lrelease translator/ts/translate_vn.ts)
    system(lrelease translator/ts/translate_us.ts)
}

LIBS += -ltag

DEFINES += MODE_APP