import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {

    function openLogin(){login.open()}

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
                Layout.fillWidth: true
                placeholderText: "ID"
                text: "nsopr@outlook.jp"
            }
            TextField{
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
                onRejected: login.close()

            }
        }
    }
}
