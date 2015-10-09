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
    
    property string fileName
    
    title: qsTr("Save changes?")
    height: Math.max(label.height, buttonColumn.height) + platformStyle.paddingLarge
    
    Label {
        id: label
        
        anchors {
            left: parent.left
            right: buttonColumn.left
            rightMargin: platformStyle.paddingMedium
            verticalCenter: parent.verticalCenter
        }
        wrapMode: Text.WordWrap
        text: qsTr("Save changes to document") + (fileName ? " \"" + fileName + "\" " : " ") + qsTr("before closing?")
    }
    
    Column {
        id: buttonColumn
        
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        spacing: platformStyle.paddingMedium
        
        Button {
            id: acceptButton
            
            text: qsTr("Yes")
            style: DialogButtonStyle {}
            onClicked: root.done(1);
        }
        
        Button {
            id: rejectButton
            
            text: qsTr("No")
            style: DialogButtonStyle {}
            onClicked: root.done(2);
        }
    }
}
