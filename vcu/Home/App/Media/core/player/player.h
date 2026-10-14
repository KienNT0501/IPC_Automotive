#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QMediaPlayer>
#include <QMediaPlaylist>
#include <QTimer>
#include <taglib/taglib_export.h>
#include <QTime>
#include <taglib/id3v2header.h>
#include <QDebug>
#include <taglib/fileref.h>
#include <taglib/tag.h>
#include <taglib/mpegfile.h>
#include <taglib/id3v2tag.h>
#include <taglib/id3v2frame.h>
#include <taglib/attachedpictureframe.h>
#include <QUrl>
#include <QMediaService>
#include <QMediaMetaData>
#include <QFileInfo>
#include <QDir>
#include <QStandardPaths>
#include <fstream>
#include <string>
#include "../playlist/playlist.h"
class Player : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qint64 m_duration READ duration NOTIFY durationChanged)
    Q_PROPERTY(qint64 m_position READ position NOTIFY positionChanged)
public:
    explicit Player(QObject *parent = nullptr);

signals:
    void currentIndexChanged(int index);

    void durationChanged(QString s);
    void positionChanged(QString s);

    void currentMediaChanged();
    void artViewChanged(int index);
    void listViewChanged(int index);

    
public slots:


void addToPlaylist(const QList<QUrl> &urls);


// function for play-back
    void open();
    void seek(qint64 mseconds);    
    void jumpTomedia(int index);
    void next();
    void previous();
    void shuffle();
    void start();
    void stop();

// function for hadle signal from QML

    void updateArtViewPresent(int index);
    void updateListViewPresent(int index);

// function for time and duration update

    void updateDurationInfo(qint64 currentInfo);
    void updatePositionInfo(qint64 currentInfo);

    qint64 duration() const;
    qint64 position() const;
    QString formatTime (qint64 currentInfo);

    void onoffState(bool val);
    void shuffleButtonState(bool states);
    void replayButtonState(bool states);


// For index binding to QML

    qint64 currentIndex() const;
    void setCurrentIndex(qint64 index);

QString getAlbumArtt(QUrl url);

public:

// ==== Core ====
    QMediaPlayer* player = nullptr;
    QMediaPlaylist *playlist = nullptr;
    QTimer *timer = nullptr;
    PlaylistModel* playlistModel = nullptr;

// === Handle present duration ===
    qint64 m_duration;
    qint64 m_position;

// === Handle button State ===
    bool playButtonstate =true;
    bool shuffleButton = false;
    bool replayButton = false;

// === Handle current played music (index) ===

    qint64 m_currentIndex;

};

#endif
