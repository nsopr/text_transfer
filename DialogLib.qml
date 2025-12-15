import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {

    function openLogin(){login.open()}

    Connections{
        target: firebase

        function onLogin_failed(errMsg){
            errLogin.text = errMsg
            if(!login.opened()) login.open()
        }
        function onLogin_succeeded(){ login.close() }
    }

    Dialog{
        id: login
        anchors.centerIn: parent
        closePolicy: "NoAutoClose"
        width: 300
        ColumnLayout{
            anchors.fill: parent
            spacing: 10
            Label{
                text: "ログイン"
            }
            TextField{
                id: loginID
                Layout.fillWidth: true
                placeholderText: "ID"
                text: "nsopr@outlook.jp"
            }
            TextField{
                id: loginPW
                Layout.fillWidth: true
                placeholderText: "パスワード"
                echoMode: "Password"
            }
            Label{
                id: errLogin
            }
            DialogButtonBox{
                Layout.alignment: Qt.AlignRight
                standardButtons: Dialog.Ok|Dialog.Cancel
                onAccepted: firebase.login(loginID.text, loginPW.text)
                onRejected: login.close()
            }
        }
    }
}
