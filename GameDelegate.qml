import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle
{
    id: gameItem
    readonly property color selectedBackgroundColor: "#87CEFA"
    readonly property color onclickedBackgroundColor: "#00CED1"

    property bool isCurrent: gameItem.ListView.view.currentIndex === index
    property bool selected: catMouseArea.containsMouse || isCurrent
    property variant gameData: model

    width: parent ? parent.width : gameList.width
    height: 120
    radius : 20

    states:
    [
        State
        {
            when: selected
            PropertyChanges
            {
                target: gameItem;
                color: isCurrent ? onclickedBackgroundColor : selectedBackgroundColor
            }
        }
    ]

    MouseArea
    {
        id: catMouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked:
        {
            gameItem.ListView.view.currentIndex = index
            gameItem.forceActiveFocus()
        }
    }
    Item
    {
        id: itemOfCats
        width: parent.width
        height: 120
        Column
        {
            id: t21
            anchors.left: parent.left
            anchors.leftMargin: 10
            width: 120
            anchors.verticalCenter: parent.verticalCenter
            Text
            {
                id: t11
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Название:"
                color: "firebrick"
                font.pointSize: 12
            }
            Text
            {
                id: textName
                anchors.horizontalCenter: parent.horizontalCenter
                text: GameName
                color: "purple"
                font.pointSize: 18
                font.bold: true
            }
        }

        Column
        {
            id: t22
            anchors.left: t21.right
            anchors.leftMargin: 50
            width: 150
            anchors.verticalCenter: parent.verticalCenter
            Text
            {
                id: t14
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Платформа:"
                color: "firebrick"
                font.pointSize: 12
            }
            Text
            {
                id: textBreed
                anchors.horizontalCenter: parent.horizontalCenter
                text: GamePlatform
                color: "purple"
                font.pointSize: 18
                font.bold: true
            }
            Text
            {
                id: t13
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Лет игре:"
                color: "firebrick"
                font.pointSize: 12
            }
            Text
            {
                id: textAge
                anchors.horizontalCenter: parent.horizontalCenter
                text: GameAge
                color: "purple"
                font.pointSize: 16
                font.bold: true
            }
        }
        Column
        {
            id: t24
            anchors.left: t22.right
            anchors.leftMargin: 30
            width: 250
            anchors.verticalCenter: parent.verticalCenter
            Text
            {
                id: t12
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Разработчик:"
                color: "firebrick"
                font.pointSize: 12
            }
            Text
            {
                id: textOwner
                anchors.horizontalCenter: parent.horizontalCenter
                text: GameDeveloper
                color: "purple"
                font.pointSize: 16
                font.bold: true
            }
        }
    }
}
