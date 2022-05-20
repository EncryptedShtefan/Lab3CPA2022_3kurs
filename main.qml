import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window
{
    visible: true
    width: 640
    height: 480
    title: qsTr("Каталог геймера")
    property var combomodel : getPlatforms()

    SystemPalette
    {
        id: palette;
        colorGroup: SystemPalette.Active
    }

    Rectangle
    {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: btnAdd.top
        anchors.bottomMargin: 8
        border.color: "gray"
        ScrollView
        {
            anchors.fill: parent
            ListView
            {
                id: gameList
                anchors.fill: parent
                model: gameModel
                delegate: GameDelegate{}
                clip: true //
                activeFocusOnTab: true
                focus: true
            }
        }
   }

    Button
    {
        id: btnAdd
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.rightMargin: 8
        anchors.right:btnEdit.left
        text: "Добавить"
        width: 100
        onClicked: windowAdd.show()
    }
    Button
    {
        id: btnEdit
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: btnDel.left
        anchors.rightMargin: 8
        text: "Изменить"
        width: 100
        onClicked:
        {
            var nameGame = gameList.currentItem.gameData.GameName
            var developerGame = gameList.currentItem.gameData.GameDeveloper
            var ageGame = gameList.currentItem.gameData.GameAge
            var platformGame = gameList.currentItem.gameData.GamePlatform

            windowEdit.execute(nameGame, platformGame, ageGame, platformGame, gameList.currentIndex)
        }
    }

    Button
    {
        id: btnDel
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right:parent.right
        anchors.rightMargin: 8
        text: "Удалить"
        width: 100
        enabled: gameList.currentIndex >= 0
        onClicked: remove(gameList.currentIndex)
    }



    AddDialog {
        id: windowAdd
    }
    EditDialogue{
        id: windowEdit
    }
}
