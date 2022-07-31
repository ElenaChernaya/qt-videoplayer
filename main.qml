import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml 2.12
import QtMultimedia 5.12


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // Задаем прямоугольную оболочку
    Rectangle {
        id: display
        width: 600
        height: 300
        border.color: "black"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter

        gradient: Gradient {
             GradientStop { position: 0.0; color: "#7c90bf" }
             GradientStop { position: 0.5; color: "#a95bbf" }
             GradientStop { position: 1.0; color: "#ee6aff" }
        }


        // Вставляем картинку
        Image { 
            id: img1
            width: 600
            height: 300
            source: "qrc:/../../Users/Elena/Desktop/img/manson.png"
        }


        // Кнопка play. Запуск видео. Цвет кнопки - прозрачный
        Button {
            id: play
            background: transparent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            // Юникод-символ, соответствующий стандартным иконкам запуска проигрывания
            Text {
                id: icon
                font.pointSize: 60
                text: qsTr("▶️")
                color: "#383838"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            onClicked: {
                 img1.source = "qrc:/../../Users/Elena/Desktop/img/manson2.png"
                 icon.text = "||"
                 icon.font.pointSize = 30
                 icon.font.bold = 10

            }
        }


        // Ползунок текущего места воспроизведения.
        ProgressBar {
            id: control
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 150


            background: Rectangle {
                id: line
                implicitWidth: 600
                implicitHeight: 4
                color: "#cecece"
                radius: 2
            }

            contentItem: Item {
                implicitWidth: 200
                implicitHeight: 4

                Rectangle {
                    id: segment
                    width: 480
                    height: 4
                    radius: 2
                    color: "#5e5e5e"
                }
            }
        }


        // Название клипа. Верхний левый угол прямоугольника
        Text {
            id: header
            text: qsTr("Marilyn Manson - The Beautiful People (Official Video)")
            font.pointSize: 12
            color: "white"
        }


    }


    // Кнопка 'stop'
    Button {
        id: iconStop
        text: qsTr("▪")
        background: transparent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 78
        font.pointSize: 70

        onClicked: {
            icon.text = "▶️"
            icon.font.pointSize = 60
            header.color = "black"
            segment.color = "#cecece"
        }

    }


    Text {
        id: iconRight
        text: qsTr("⏩️")
        color: "#383838"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 50
        anchors.verticalCenterOffset: 80
        font.pointSize: 30
    }

    Text {
        id: iconLeft
        text: qsTr("⏪️")
        color: "#383838"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -50
        anchors.verticalCenterOffset: 80
        font.pointSize: 30
    }
}
