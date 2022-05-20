import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window
{
    id: root
    modality: Qt.ApplicationModal
    title: qsTr("Редактирование")
    minimumWidth: 400
    maximumWidth: 400
    minimumHeight: 300
    maximumHeight: 300
    property var combomodel : getPlatforms()

    property int currentIndex: -1

    GridLayout
    {
        anchors
        {
            left: parent.left;
            top: parent.top;
            right: parent.right;
            bottom: buttonCancel.top;
            margins: 10
        }
        columns: 2

        Label
        {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Название: ")
        }
        TextField
        {
            id: textName
            Layout.fillWidth: true
        }

        Label
        {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Разработчик: ")
        }
        TextField
        {
            id: textDeveloper
            Layout.fillWidth: true
        }

        Label
        {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Лет игре: ")
        }
        SpinBox
        {
            id: textAge
            Layout.fillWidth: true
            value: 0;
        }

        Label
        {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Платформа: ")
        }
        ComboBox
        {
            id: textBreed
            Layout.fillWidth: true
            model: combomodel
        }
    }
    Button
    {
        visible: {root.currentIndex > -1}
        anchors { right: buttonCancel.left; verticalCenter: buttonCancel.verticalCenter; rightMargin: 10 }
        text: qsTr("Сохранить")
        width: 100
        onClicked:
        {
            root.hide()
            edit(textName.text, textDeveloper.text, textAge.value, textBreed.currentText, root.currentIndex)
        }
    }
    Button
    {
        id: buttonCancel
        anchors { right: parent.right; bottom: parent.bottom; rightMargin: 10; bottomMargin: 10 }
        text: qsTr("Отмена")
        width: 100
        onClicked:
        {
             root.hide()
        }
    }

    function execute(name, developer, age, platform, index)
    {
        textName.text = name
        textDeveloper.text = developer
        textAge.value = age
        //textPlatform.text = platform
        root.currentIndex = index

        root.show()
    }
}
