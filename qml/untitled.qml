import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import QtQuick.XmlListModel 2.0
ApplicationWindow
{
    property XmlListModel rateModel: XmlListModel {
           id: xmlModel
           source: "http://www.cbr.ru/scripts/XML_daily.asp"
           query: "/ValCurs/Valute"
           XmlRole {name: "valute"; query: "CharCode/string()"}
           XmlRole {name: "rate"; query: "Value/string()"}
           XmlRole {name: "nominal"; query: "Nominal/string()"}
     }
    initialPage: Component { FirstPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations


//       Component {
//           id: xmlDelegate

//           Item {
//             height: 40
//             width: parent.width
//               Rectangle {
//                   height: parent.height
//                   width: parent.width / 2
//                   color: "#ff0000"
//                   radius: 5
//                   Text {
//                       anchors.centerIn: parent
//                       text: valute
//                   }
//               }
//               Rectangle {
//                   x: parent.width / 2
//                   height: parent.height
//                   width: parent.width / 2
//                   color: "#00ff00"
//                   radius: 5
//                   Text {
//                       anchors.centerIn: parent
//                       text: rate
//                   }
//               }
//           }
//       }

//       ListView {
//           anchors.fill: parent
//           model: xmlModel
//           delegate: xmlDelegate
//       }
}
