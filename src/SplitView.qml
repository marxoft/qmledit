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

Item {
    id: root
    
    property DocumentView currentView: leftView
    property bool split: false
        
    function closeAllDocuments() {
        return (leftView.closeAllDocuments())
               && ((!rightViewLoader.item) || (rightViewLoader.item.closeAllDocuments()));
    }
    
    DocumentView {
        id: leftView
        
        anchors {
            left: parent.left
            right: rightViewLoader.sourceComponent ? parent.horizontalCenter : parent.right
            rightMargin: rightViewLoader.sourceComponent ? platformStyle.paddingMedium : 0
            top: parent.top
            bottom: parent.bottom
        }
        onCountChanged: if (count == 0) openDocument();
        
        Connections {
            target: leftView.currentDocument
            onFocusChanged: if (focus) root.currentView = leftView;
        }
        
        Component.onCompleted: if (count == 0) openDocument();
    }
    
    Loader {
        id: rightViewLoader
        
        anchors {
            left: leftView.right
            leftMargin: platformStyle.paddingMedium
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
    }
    
    Component {
        id: rightViewComponent
        
        DocumentView {
            id: rightView
            
            Connections {
                target: rightView.currentDocument
                onFocusChanged: if (focus) root.currentView = rightView;
            }
            
            onCountChanged: if (count == 0) root.split = false;
        }
    }
    
    onSplitChanged: {
        if (split) {
            rightViewLoader.sourceComponent = rightViewComponent;
            
            if (leftView.count > 0) {
                rightViewLoader.item.addDocument(leftView.currentDocument);
            }
            
            rightViewLoader.item.forceActiveFocus();
            currentView = rightViewLoader.item;
        }
        else if (rightViewLoader.item) {
            if (rightViewLoader.item.count > 0) {
                var docs = [];
            
                for (var i = 0; i < rightViewLoader.item.count; i++) {
                    var doc = rightViewLoader.item.getDocument(i);
                    
                    if (!doc.empty) {
                        docs.push(doc);
                    }
                }
            
                for (var j = 0; j < docs.length; j++) {
                    leftView.addDocument(docs[j]);
                }
            }
            
            leftView.forceActiveFocus();
            currentView = leftView;
            rightViewLoader.sourceComponent = undefined;
        }
    }            
}
