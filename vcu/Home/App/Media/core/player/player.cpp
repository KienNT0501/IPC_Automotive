#include "player.h"

Player::Player(QObject *parent)
    : QObject(parent)
{
    player = new QMediaPlayer(this);
    playlist = new QMediaPlaylist(this);

    player->setPlaylist(playlist);
    playlistModel = new PlaylistModel(this);


    // ===== DEBUG =====
    connect(player,
            &QMediaPlayer::mediaStatusChanged,
            this,
            [](QMediaPlayer::MediaStatus status)
    {
        qDebug() << "MediaStatus =" << status;
    });

    connect(player,
            &QMediaPlayer::stateChanged,
            this,
            [](QMediaPlayer::State state)
    {
        qDebug() << "State =" << state;
    });

    connect(player,
            QOverload<QMediaPlayer::Error>::of(&QMediaPlayer::error),
            this,
            [](QMediaPlayer::Error error)
    {
        qDebug() << "Error =" << error;
    });

    // ===== END OF DEBUG =====

    // ==== SIGNAL FOR INDEX OF LIST SONG CHANGED ====
    connect(playlist, &QMediaPlaylist::currentIndexChanged,
        this, [this](int index) {
            qDebug() << "Playlist current index changed:" << index;
            emit currentIndexChanged(index);
        });
    
    connect(this, &Player::artViewChanged,
        this, &Player::updateArtViewPresent);

    connect(this, &Player::listViewChanged,
        this, &Player::updateListViewPresent);

    // ==== SIGNAL END OF MEDIA ====
    connect(player, &QMediaPlayer::mediaStatusChanged,
        this, [this](QMediaPlayer::MediaStatus status) {

        if (status == QMediaPlayer::EndOfMedia) {

            qDebug() << "========== END OF MEDIA ==========";

            if (replayButton) {
                player->play();
            }
            else if (shuffleButton) {
                shuffle();
                player->play();
            }
            else {
                next();
            }
        }
    });

    // ==== SIGNAL FOR MEDIA CHANGED ====
    connect(player,
            &QMediaPlayer::currentMediaChanged,
            this,
            [this](){
                qDebug()<<"Media changed!";
                start();
            });
    // ==== SIGNAL FOR UPDATE DURATION ====
    connect(player,
            &QMediaPlayer::durationChanged,
            this,
            [&](qint64 duration)
    {
        updateDurationInfo(duration);
        QString strDuration = formatTime(m_duration);
        emit durationChanged(strDuration);
    }); 

    // ==== SIGNAL FOR UPDATE PROGRESS BAR ====
    connect(player,
            &QMediaPlayer::positionChanged,
            this,
            [&] (qint64 position)
    {
        updatePositionInfo(position);
        QString strPosition = formatTime(m_position);
        emit positionChanged(strPosition);
    });

    // ==== SIGNAL FOR SONG SELECTED ====

    open();

    if (!playlist->isEmpty()) {
        setCurrentIndex(0);
    }
}

void Player::open()
{
    QStringList locations = QStandardPaths::standardLocations(QStandardPaths::MusicLocation);
        if (locations.isEmpty()) {
            qWarning() << "Music directory not found!";
            return;
        }
    QDir directory(QStandardPaths::standardLocations(QStandardPaths::MusicLocation)[0]);
    QFileInfoList musics = directory.entryInfoList(QStringList() << "*.mp3",QDir::Files);
    QList<QUrl> urls;
    for (int i = 0; i < musics.length(); i++){
        urls.append(QUrl::fromLocalFile(musics[i].absoluteFilePath()));
    }
    emit currentMediaChanged();
    addToPlaylist(urls);
}

void Player::addToPlaylist(const QList<QUrl> &urls)
{
    for (auto &url: urls) {

        playlist->addMedia(url);
        TagLib::FileRef f(url.path().toStdString().c_str());
        TagLib::Tag *tag = f.tag();
        if(tag){
            QString title = tag->title().isEmpty() ? "Unknow Title" : QString::fromWCharArray(tag->title().toCWString());
            QString artist = tag->artist().isEmpty() ? "Unknow Artist" : QString::fromWCharArray(tag->artist().toCWString());

            Song song(QString::fromWCharArray(tag->title().toCWString()),
                      QString::fromWCharArray(tag->artist().toCWString()),
                      getAlbumArtt(url),url.toDisplayString());
            qDebug()<<"Adding song to playlist : "<<title<<" - "<<artist<<url.toString()<<getAlbumArtt(url);
            playlistModel->addSong(song);
        }
        else{
            qWarning()<<"Can not retrieve information from: "<<url.toString();
        }
    }
}


void Player::seek(qint64 mseconds)
{
    qint64 maxDuration = m_duration;
    qint64 newPosition = qBound(qint64(0), mseconds, maxDuration);
    qDebug()<<"Seeking to: "<<newPosition<<" / "<<maxDuration;
    player->pause();
    player->setPosition(newPosition);
    start();
}

void Player::jumpTomedia(int index) {
    int count = playlist->mediaCount();

    qDebug() << "Jumping to index:" << index
             << "(Playlist count:" << count << ")";

    if (count <= 0) {
        qWarning() << "Playlist is empty!";
        return;
    }

    if (index < 0 || index >= count) {
        qWarning() << "Invalid index:" << index;
        return;
    }

    setCurrentIndex(index);

    qDebug() << "Current index:" << playlist->currentIndex();
    qDebug() << "Current media:" << playlist->currentMedia().canonicalUrl();
}


void Player::next() {
    if (shuffleButton) {
        shuffle();
        return;
    }

    int currentIndex = playlist->currentIndex();
    int totalCount = playlist->mediaCount();

    if (totalCount <= 0) {
        qWarning() << "Playlist is empty!";
        return;
    }

    int nextIndex = (currentIndex + 1) % totalCount;

    qDebug() << "Next:" << currentIndex
             << "->" << nextIndex;

    setCurrentIndex(nextIndex);
}

void Player::previous() {
    if(shuffleButton == false){
        int currentIndex = playlist->currentIndex();
        int totalCount = playlist->mediaCount();
        if (totalCount == 0) {
            qWarning() << "Playlist is empty!";
            return;
        }
        if (currentIndex > 0 && currentIndex < totalCount) {
            setCurrentIndex(currentIndex - 1);
            qDebug() << "Current index:" << currentIndex << ", Total media count:" << totalCount;
    
        } else {
            qWarning() << "Already at the first song, move to the last song";
            setCurrentIndex(totalCount-1);
        
        }
    }
    else{
        shuffle();
    }
}
void Player::shuffle()
{
    int totalCount = playlist->mediaCount();

    if (totalCount <= 0) {
        qWarning() << "Playlist empty";
        return;
    }

    int currentIndex = rand() % totalCount;
    setCurrentIndex(currentIndex);

}

void Player::updateDurationInfo(qint64 currentInfo)
{
    m_duration = currentInfo;
}

void Player::updatePositionInfo(qint64 currentInfo)
{
    m_position = currentInfo;
}

QString Player::formatTime (qint64 currentInfo) {
    currentInfo = currentInfo/1000;

    QTime currentTime((currentInfo / 3600) % 60,
                      (currentInfo / 60) % 60,
                      currentInfo % 60,
                      currentInfo % 1000);
    QString format = currentTime.hour()>0 ? "hh:mm:ss" : "mm:ss";
    return currentTime.toString(format);
}

qint64 Player::position() const
{
    return m_position;
}


qint64 Player::duration() const
{
    return m_duration;
}


void Player::start()
{
    qDebug() << "========== START ==========";
    qDebug() << "Current index:" << playlist->currentIndex();
    qDebug() << "Play state:" << playButtonstate;

    if (playlist->currentIndex() == -1) {
        qWarning() << "No current media!";
        return;
    }

    if (!playButtonstate) {
        qDebug() << "Play state is false!";
        return;
    }

    qDebug() << "Playing:"
             << playlist->currentMedia().canonicalUrl();

    player->play();
    
}

void Player::stop()
{

    player->pause(); // Stop the timer
}

void Player::onoffState(bool val)
{
    playButtonstate = val;
}

void Player::shuffleButtonState(bool states)
{
    shuffleButton = states;
}

void Player::replayButtonState(bool states)
{
    replayButton = states;
}

QString Player::getAlbumArtt(QUrl url)
{
    static const char *IdPicture = "APIC" ;
    TagLib::MPEG::File mpegFile(url.path().toStdString().c_str());
    TagLib::ID3v2::Tag *id3v2tag = mpegFile.ID3v2Tag();
    TagLib::ID3v2::FrameList Frame ;
    TagLib::ID3v2::AttachedPictureFrame *PicFrame ;
    void *SrcImage ;
    unsigned long Size ;
    QString mp3Path = url.toLocalFile();

    QFileInfo info(mp3Path);

    QString jpgPath =
        info.absolutePath() + "/" +
        info.completeBaseName() + ".jpg";
    
    FILE *jpegFile;
    jpegFile = fopen(
    jpgPath.toStdString().c_str(),
    "wb");
    if (!jpegFile) {
        qWarning() << "Cannot create image file";
        return "qrc:/Img/Media/album_art.png";
    }
    if ( id3v2tag )
    {
        // picture frame
        Frame = id3v2tag->frameListMap()[IdPicture] ;
        if (!Frame.isEmpty() )
        {
            for(TagLib::ID3v2::FrameList::ConstIterator it = Frame.begin(); it != Frame.end(); ++it)
            {
                PicFrame = static_cast<TagLib::ID3v2::AttachedPictureFrame*>(*it) ;
                //  if ( PicFrame->type() ==
                //TagLib::ID3v2::AttachedPictureFrame::FrontCover)
                {
                    // extract image (in it’s compressed form)
                    Size = PicFrame->picture().size() ;
                    SrcImage = malloc ( Size ) ;
                    if ( SrcImage )
                    {
                        memcpy ( SrcImage, PicFrame->picture().data(), Size ) ;
                        fwrite(SrcImage,Size,1, jpegFile);
                        fclose(jpegFile);
                        free( SrcImage ) ;
                        return QUrl::fromLocalFile(jpgPath).toString();
                    }
                }
            }
        }
    }
    else
    {
        qDebug() <<"id3v2 not present";
        return "qrc:/Img/Media/album_art.png";
    }
    return "qrc:/Img/Media/album_art.png";

}

void Player::setCurrentIndex(qint64 index)
{
    if (index < 0 || index == m_currentIndex)
        return;

    playlist->setCurrentIndex(index);

    m_currentIndex = index;
    emit currentIndexChanged(m_currentIndex);
}

qint64 Player::currentIndex() const
{
    return m_currentIndex;
}

void Player::updateArtViewPresent(int index){
    
    qDebug() << "=== Update Art View === ";
    setCurrentIndex(index);

}

void Player::updateListViewPresent(int index){
    
    qDebug() << "=== Update List View === ";
    setCurrentIndex(index);
}

