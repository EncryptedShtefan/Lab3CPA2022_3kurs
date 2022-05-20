import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window
{
    id: root
    modality: Qt.ApplicationModal
    title: qsTr("Добавить игру")
    minimumWidth: 400
    maximumWidth: 400
    minimumHeight: 300
    maximumHeight: 300
    property var combomodel : getPlatforms()

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
            text: qsTr("Дата выпуска: ")
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
            id: textPlatform
            Layout.fillWidth: true
            model: combomodel
        }
    }

    Button
    {
        visible: {textName.length > 0 && textDeveloper.length > 0 && textPlatform.currentIndex != -1}
        anchors { right: buttonCancel.left; verticalCenter: buttonCancel.verticalCenter; rightMargin: 10 }
        text: qsTr("Добавить")
        width: 100
        onClicked:
        {
            root.hide()
            add(textName.text, textDeveloper.text, textAge.value, textPlatform.currentText)
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

    onVisibleChanged:
    {
      if (visible)
      {
          textName.text = ""
          textDeveloper.text = ""
          textAge.value = 0
          textPlatform.currentIndex = "0"
      }
    }
}
