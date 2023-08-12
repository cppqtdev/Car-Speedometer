import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
ApplicationWindow {
    id: window
    width: 1060
    height: 635
    visible: true
    color: "#000000"
    title: "Car Speed Guage"



    RowLayout{
        anchors.centerIn:parent
        spacing: 100

        Gauge2 {
            id:leftGuage
            property bool accelerating
            width: 400
            height: 400
            value: accelerating ? maximumValue : 0
            maximumValue: 250
            Component.onCompleted: forceActiveFocus()
            Behavior on value { NumberAnimation { duration: 1000 }}
            Keys.onSpacePressed: leftGuage.accelerating = true
            Keys.onEnterPressed: rightGuage.accelerating = true
            Keys.onReturnPressed: rightGuage.accelerating = true

            Keys.onReleased: {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    rightGuage.accelerating = false;
                    event.accepted = true;
                }else if (event.key === Qt.Key_Space) {
                    leftGuage.accelerating = false;
                    event.accepted = true;
                }
            }
        }

        Gauge2 {
            id:rightGuage
            property bool accelerating
            width: 400
            height: 400
            value: accelerating ? maximumValue : 0
            maximumValue: 100
            Component.onCompleted: forceActiveFocus()
            Behavior on value { NumberAnimation { duration: 1000 }}
            Keys.onSpacePressed: leftGuage.accelerating = true
            Keys.onEnterPressed: rightGuage.accelerating = true
            Keys.onReturnPressed: rightGuage.accelerating = true

            Keys.onReleased: {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    rightGuage.accelerating = false;
                    event.accepted = true;
                }else if (event.key === Qt.Key_Space) {
                    leftGuage.accelerating = false;
                    event.accepted = true;
                }
            }
        }
    }

//    Gauge2 {
//        visible: false
//        property bool accelerating
//        width: 400
//        height: 400
//        value: accelerating ? maximumValue : 0
//        maximumValue: 250
//        Component.onCompleted: forceActiveFocus()
//        Behavior on value { NumberAnimation { duration: 1000 }}

//        Keys.onSpacePressed: accelerating = true
//        Keys.onReleased: {
//            if (event.key === Qt.Key_Space) {
//                accelerating = false;
//                event.accepted = true;
//            }
//        }
//    }
}
