/*!
 * Copyright (C) 2017 Stuart Howarth <showarth@marxoft.co.uk>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 1.0
import org.hildon.components 1.0
import "../app"

Window {
    id: root

    property Document document
    property QtObject object

    function reload() {
        if (object) {
            object.destroy();
        }

        if (!document) {
            return;
        }

        try {
            object = Qt.createQmlObject(document.text, root);
        }
        catch(e) {
            var message = qsTr("Error creating object") + "\n\n";

            try {
                var error = e.qmlErrors[0];
                message += qsTr("Line") + ": " + error.lineNumber + "\n" + qsTr("Column") + ": "
                + error.columnNumber + "\n" + qsTr("Error") + ": " + error.message;
            }
            catch(e) {
                message += qsTr("Error: Unknown error");
            }

            popupManager.open(informationBox, root, {text: message});
            return;
        }

        if (typeof object["show"] === "function") {
            // Object is a dialog/popup/window
            object.show();
        }
        else if (object.hasOwnProperty("parent")) {
            object.parent = contentItem;
        }
    }

    title: qsTr("QML Preview")
    visible: true
    menuBar: MenuBar {
        MenuItem {
            text: qsTr("Reload")
            autoRepeat: false
            onTriggered: reload()
        }
    }
    onDocumentChanged: reload()

    Component {
        id: informationBox

        InformationBox {
            property alias text: label.text

            timeout: 0
            height: label.height + platformStyle.paddingLarge * 2

            Label {
                id: label

                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    margins: platformStyle.paddingLarge
                }
                color: platformStyle.reversedTextColor
            }
        }
    }
}

