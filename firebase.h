#ifndef FIREBASE_H
#define FIREBASE_H

#include <QObject>
#include <QJsonObject>
#include <QtNetwork>

#ifdef QT_WASM_BUILD
#include <emscripten.h>
#else
//qt6keychain include here
#endif

class firebase : public QObject
{
    Q_OBJECT
public:
    firebase();

#ifdef QT_WASM_BUILD    //save the data to localstorage
    void    setLocalStorage(QString key, QString value);
    QString getLocalStorage(QString key);
    void    refresh_refreshToken();
#else
    //qt6keychain here
#endif

    //variable
    QNetworkAccessManager *manager = new QNetworkAccessManager;
    QString prefix  = "text_transfer_";
    QString API_key = "AIzaSyCJs93CshAasa2XbYeEEZjY8OAclKujwaM";    //leak ok
    QString idToken, ref_token;

    //QML
    QStringListModel textList;

    //function
    QNetworkReply *send_request(QUrl url, QJsonObject headers, QByteArray method, QByteArray data);

signals:
    void login_failed(QString errString);
    void login_succeeded();

public slots:
    void login(QString id, QString pass);

};

#endif // FIREBASE_H
