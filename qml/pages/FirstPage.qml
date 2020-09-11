import QtQuick 2.0
import Sailfish.Silica 1.0
//import QtQuick.Controls 1.0
Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
//        PullDownMenu {
//            MenuItem {
//                text: qsTr("Show Page 2")
//                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
//            }
//        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Online converter")
            }
            Label {
                id: firstCurrency
                x: Theme.horizontalPageMargin
                text: qsTr("Value in Dollars")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                id: firstValue
                placeholderText: qsTr("Enter value")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
//                onEditingFinished: {

//                }
            }
            Label {
                id: secondСurrency
                x: Theme.horizontalPageMargin
                text: qsTr("Value in roubles")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge

            }
            Label {
                id: secondValue
                x: Theme.horizontalPageMargin
                text: firstValue.text * 75.1
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge

            }

        }
    }
}
