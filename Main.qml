import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property string prefix: "https://dl.dropboxusercontent.com/scl/fi/"

    Material.theme: Material.Dark

    FontLoader{
        id: jpFont
        source: prefix + "1gougrpg0ddp8v9apneug/BIZ-UDGothic-01.ttf?rlkey=44ks4up2ft776ggx9o48zkdvr&st=yv81cgv3&dl=0"
    }
    font.family: jpFont.name

    DialogLib{
        anchors.centerIn: parent
        Component.onCompleted: openLogin()
    }

    ColumnLayout{
        anchors.centerIn: parent
        width:  parent.width * 0.98
        height: parent.height * 0.98
        spacing: 10

        Row{
            Layout.alignment: Qt.AlignHCenter
            Image{
                width:  height
                height: parent.height
                source: prefix + "lifidknmmt2f8w2q1l3n5/translate_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.png?rlkey=fwad6bzmlw370fsmmhcx20nce&st=elsyk3iy&dl=0"
            }
            Image{
                width:  height
                height: parent.height
                source: prefix + "k99rme6ulk0q4p8n8fn4s/language_japanese_kana_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.png?rlkey=2097s00e9zxd8getizsk66qsh&st=wjgxyanh&dl=0"
            }
            Image{
                width:  height
                height: parent.height
                source: prefix + "mnobfsokwuv33unoaxzpe/swap_vert_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.png?rlkey=oskwrshkriztzs5b1y0t5w4kk&st=been82ve&dl=0"
            }
            Label{
                font.pointSize: Qt.application.font.pointSize * 2
                text: "テキスト交換アプリ"
            }
        }
        TextArea{
            Layout.fillWidth: true
            placeholderText: "送信テキスト"
            // Layout.fillHeight: true
        }
        Row{
            Layout.fillWidth: true
            Label{
                height: parent.height
                verticalAlignment: "AlignVCenter"
                text: "暗号化(あいことば)"
            }
            ComboBox{
                id: isEncryptNeeded
                model: ["なし", "あり"]
            }
            TextField{
                width: parent.width - parent.children[0].width - parent.children[1].width
                enabled: isEncryptNeeded.currentIndex === 1
                placeholderText: "暗号化キー"
            }
        }
        Button{
            Layout.fillWidth: true
            text: "登録"
        }
        ListView{
            Layout.fillWidth: true
            Layout.fillHeight: true

            model: textList

            delegate: RowLayout{
                width: ListView.view.width
                TextArea{
                    id: encryptedText
                    Layout.fillWidth: true

                }
                TextField{
                    Layout.fillWidth: true
                    placeholderText: "復号キー(あいことば)"
                }
                TextArea{
                    id: decryptedText
                    Layout.fillWidth: true
                }
            }
        }
    }
}
