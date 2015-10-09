/*
 * Copyright (C) 2015 Stuart Howarth <showarth@marxoft.co.uk>
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

Dialog {
    id: root
    
    property alias findText: findField.text
    property alias replaceText: replaceField.text
    property alias matchCase: matchCaseCheckBox.checked
    property alias wholeWordsOnly: wholeWordsCheckBox.checked
    
    title: qsTr("Replace")
    height: column.height + platformStyle.paddingMedium
    
    Flickable {
        id: flickable
        
        anchors {
            left: parent.left
            right: button.left
            rightMargin: platformStyle.paddingMedium
            top: parent.top
            bottom: parent.bottom
        }
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        contentHeight: column.height
    
        Column {
            id: column
        
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
            spacing: platformStyle.paddingMedium
        
            Label {
                width: parent.width
                text: qsTr("Find text")
            }
        
            TextField {
                id: findField
            
                width: parent.width
                onAccepted: if (text) root.accept();
            }
        
            Label {
                width: parent.width
                text: qsTr("Replace with")
            }
        
            TextField {
                id: replaceField
            
                width: parent.width
                onAccepted: if (findField.text) root.accept();
            }
        
            CheckBox {
                id: matchCaseCheckBox
            
                width: parent.width
                text: qsTr("Match case")
            }
        
            CheckBox {
                id: wholeWordsCheckBox
            
                width: parent.width
                text: qsTr("Whole words only")
            }
        }
    }
    
    Button {
        id: button
        
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        style: DialogButtonStyle {}
        text: qsTr("Done")
        enabled: findField.text != ""
        onClicked: root.accept()
    }
    
    onStatusChanged: if (status == DialogStatus.Opening) findField.forceActiveFocus();
}
