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
    
    title: qsTr("About")
    height: column.height + platformStyle.paddingMedium
    
    Flickable {
        id: flickable
        
        anchors.fill: parent
        contentHeight: column.height
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        
        Column {
            id: column
        
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
            spacing: platformStyle.paddingMedium

            Row {
                width: parent.width
                spacing: platformStyle.paddingMedium
            
                Image {
                    width: 64
                    height: 64
                    source: "image://icon/qmledit"
                }

                Label {
                    width: parent.width
                    height: 64
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: platformStyle.fontSizeLarge
                    text: "QMLEdit 0.0.1"
                }
            }
        
            Label {
                width: parent.width
                color: platformStyle.secondaryTextColor
                text: qsTr("Keyboard shortcuts")
            }
        
            Label {
                width: parent.width
                text: newTabAction.text + ": " + newTabAction.shortcut + "\n"
                      + newWindowAction.text + ": " + newWindowAction.shortcut + "\n"
                      + openFileAction.text + ": " + openFileAction.shortcut + "\n"
                      + findAction.text + ": " + findAction.shortcut + "\n"
                      + findNextAction.text + ": " + findNextAction.shortcut + "\n"
                      + findPreviousAction.text + ": " + findPreviousAction.shortcut + "\n"
                      + replaceAction.text + ": " + replaceAction.shortcut + "\n"
                      + jumpAction.text + ": " + jumpAction.shortcut + "\n"
                      + saveAction.text + ": " + saveAction.shortcut + "\n"
                      + saveAsAction.text + ": " + saveAsAction.shortcut + "\n"
                      + closeAction.text + ": " + closeAction.shortcut + "\n"
                      + closeAllAction.text + ": " + closeAllAction.shortcut + "\n"
                      + splitAction.text + ": " + splitAction.shortcut + "\n"
            }

            Label {
                width: parent.width
                wrapMode: Text.WordWrap
                textFormat: Text.RichText
                text: "&copy; Stuart Howarth 2015"
            }
        }
    }
}
