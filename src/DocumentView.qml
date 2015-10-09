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

FocusScope {
    id: root
    
    property Document currentDocument
    property alias count: tabView.count
    property alias currentIndex: tabView.currentIndex
    
    function getDocument(index) {
        return tabView.getTab(index);
    }
    
    function addDocument(document) {
        document.parent = tabView.contentItem;
        currentDocument = document;
        tabView.currentIndex = tabView.count - 1;
    }
    
    function openDocument(filePath) {
        if ((filePath) && (currentDocument) && (currentDocument.empty)) {
            currentDocument.open(filePath);
            return;
        }
        
        var document = documentComponent.createObject(tabView.contentItem);
        currentDocument = document;
        tabView.currentIndex = tabView.count - 1;
    
        if (filePath) {
            document.open(filePath);
        }
    }
    
    function closeDocument(document) {
        if (document.dirty) {
            window.activate();
            switch (dialogs.confirmCloseDocument(document.documentTitle)) {
            case 1:
                document.save();
                return false;
            case 2:
                break;
            default:
                return false;
            }
        }
        
        document.destroy();
        return true;
    }
    
    function closeCurrentDocument() {
        return currentDocument ? closeDocument(currentDocument) : false;
    }
    
    function closeAllDocuments() {
        for (var i = tabView.count - 1; i >= 0; i--) {
            if (!closeDocument(getDocument(i))) {
                return false;
            }
        }
        
        return true;
    }
    
    function forceActiveFocus() {
        if (currentDocument) {
            currentDocument.forceActiveFocus();
        }
        else {
            tabView.forceActiveFocus();
        }
    }
        
    TabView {
        id: tabView
        
        anchors.fill: parent
        frameVisible: false
        onCountChanged: {
            var document = getTab(currentIndex);
            
            if (document) {
                root.currentDocument = document;
            }
        }
        onCurrentIndexChanged: {
            var document = getTab(currentIndex);
            
            if (document) {
                root.currentDocument = document;
            }
        }
    }
    
    Component {
        id: documentComponent
    
        Document {
            anchors.fill: parent            
        }
    }
    
    onCurrentDocumentChanged: if (currentDocument) currentDocument.forceActiveFocus();    
}
