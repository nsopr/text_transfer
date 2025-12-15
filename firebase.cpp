#include "firebase.h"

firebase::firebase() {

}

#ifdef QT_WASM_BUILD
void firebase::setLocalStorage(QString key, QString value){
    QString js = QString("localStorage.setItem('%1', '%2');").arg(key, value);
    emscripten_run_script(js.toUtf8().constData());
}

QString firebase::getLocalStorage(QString key){
    QString js = QString("localStorage.getItem('%1');").arg(key);
    char* result = emscripten_run_script_string(js.toUtf8().constData());
    return QString(result);
}
#else
// read from & write via qt6keychain here
#endif

QNetworkReply *firebase::send_request(QUrl url, QJsonObject headers, QByteArray method, QByteArray data){
    QNetworkRequest request(url);
    for (auto key : headers.keys()) {
        request.setRawHeader(key.toUtf8(), headers[key].toString().toUtf8());
    }
    return manager->sendCustomRequest(request, method, data);
}

void firebase::login(QString id, QString pass){
    QUrl url("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + API_key);
    QJsonObject headers;
    headers["Content-Type"] = "application/json";

    QJsonObject data;
    data["email"] = id;
    data["password"] = pass;
    data["returnSecureToken"] = true;

    QNetworkReply *reply = send_request(url, headers, "POST", QJsonDocument(data).toJson());

    connect(reply, &QNetworkReply::finished, this, [this, reply]{
        if(reply->error() != QNetworkReply::NoError){
            emit login_failed(reply->errorString());
            return;
        }


    });
}
