import QtQuick 2.0
import Sailfish.Silica 1.0
//import QtQuick.Controls 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page
    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

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
            TextField {
                id: firstCurrency
                x: Theme.horizontalPageMargin
                text: qsTr("first charcode")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                id: firstValue

                inputMethodHints: Qt.ImhFormattedNumbersOnly
                placeholderText: qsTr("Enter value")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                id: secondСurrency
                x: Theme.horizontalPageMargin
                text: qsTr("Second charcode charcode")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge

            }
            Label {
                id: secondValue
                x: Theme.horizontalPageMargin
                text: "2134"
                /*try{
                          //Number(Number.fromLocaleString(Qt.locale(), firstValue.text) * 75.1).toLocaleCurrencyString(Qt.locale(), "USD")
                          rateModel.get(0).nominal
                      } catch(e){
                          ""
                      }*/

                    //Number(firstValue.text * 75.1).toLocaleString()
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge


            }
            function convert(){
                var firstId = -1;
                var secondId = -1;

                for(var i = 0; i < rateModel.count; i++){
                    if(rateModel.get(i).valute === firstCurrency.text){
                        firstId = i;
                        break;
                    }
                }

                for(var i = 0; i < rateModel.count; i++){
                    if(rateModel.get(i).valute === secondCurrency.text){
                        secondId = i;
                        break;
                    }
                }
                if(min(secondId, firstId) === -1){
                    secondValue.text = "wrong input";
                    return;
                }
                var val = Number(firstValue) * ((rateModel.get(firstId).rate / rateModel.get(firstId).nominal)
                                                / (rateModel.get(secondId).rate / rateModel.get(secondId).nominal));
                secondValue.text = Number(Number.fromLocaleString(Qt.locale(), string(val))).toLocaleCurrencyString(Qt.locale(), secondСurrency.text);
            }
            Button{
                id: convertButton
                onClicked: column.convert()
            }

        }
    }
}
