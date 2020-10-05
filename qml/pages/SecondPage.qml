import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0
Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    Rectangle {
        width: 360
        height: 720

        XmlListModel {
            id: xmlModel
            source: "http://www.cbr.ru/scripts/XML_daily.asp"
            query: "/ValCurs/Valute"
            XmlRole {name: "valute"; query: "CharCode/string()"}
            XmlRole {name: "rate"; query: "Value/string()"}
            XmlRole {name: "nominal"; query: "Nominal/string()"}
        }

        Component {
            id: xmlDelegate

            Item {
              height: 40
              width: parent.width
                Rectangle {
                    height: parent.height
                    width: parent.width / 3
                    color: "#ff0000"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        text: valute
                    }
                }
                Rectangle {
                    x: parent.width / 3
                    height: parent.height
                    width: parent.width / 3
                    color: "#00ff00"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        text: rate
                    }
                }
                Rectangle {
                    x: 2 * parent.width / 3
                    height: parent.height
                    width: parent.width / 3
                    color: "#00ff00"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        text: nominal
                    }
                }
            }
        }

        ListView {
            anchors.fill: parent
            model: xmlModel
            delegate: xmlDelegate
        }
        Label {
            id: secondСurrency
            x: Theme.horizontalPageMargin
            text: xmlModel.count
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge

        }
    }
}
