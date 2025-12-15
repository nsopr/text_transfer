import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Material.theme: Material.Dark

    FontLoader{
        id: jpFont
        source: "https://dl.dropboxusercontent.com/scl/fi/1gougrpg0ddp8v9apneug/BIZ-UDGothic-01.ttf?rlkey=44ks4up2ft776ggx9o48zkdvr&st=tptlmrig&dl=0"
    }
    font.family: jpFont.name

    DialogLib{
        anchors.centerIn: parent
        Component.onCompleted: openLogin()
    }
}
