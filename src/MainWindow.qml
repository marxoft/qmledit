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
import org.hildon.settings 1.0

Window {
    id: window
    
    title: "QMLEdit" + (splitView.currentView.currentDocument ? " - " + splitView.currentView.currentDocument.title : "")
    visible: true
    menuBar: MenuBar {
        MenuItem {
            action: newTabAction
        }
        
        MenuItem {
            action: newWindowAction
        }
        
        MenuItem {
            action: openFileAction
        }
        
        MenuItem {
            action: saveAction
        }
        
        MenuItem {
            action: closeAction
        }
        
        MenuItem {
            action: closeAllAction
        }
                
        MenuItem {
            text: qsTr("Settings")
            onTriggered: dialogs.showSettingsDialog()
        }
        
        MenuItem {
            text: qsTr("About")
            onTriggered: dialogs.showAboutDialog()
        }
    }
    
    Action {
        id: newTabAction
        
        autoRepeat: false
        shortcut: "Ctrl+N"
        text: qsTr("New tab")
        onTriggered: splitView.currentView.openDocument()
    }
    
    Action {
        id: newWindowAction
        
        autoRepeat: false
        shortcut: "Shift+Ctrl+N"
        text: qsTr("New window")
        onTriggered: {
            var w = Qt.createComponent(Qt.resolvedUrl("MainWindow.qml"));
            w.createObject(null);
        }
    }
    
    Action {
        id: openFileAction
        
        autoRepeat: false
        shortcut: "Ctrl+O"
        text: qsTr("Open file")
        onTriggered: dialogs.showFileDialog()
    }
    
    Action {
        id: findAction
        
        autoRepeat: false
        shortcut: "Ctrl+F"
        text: qsTr("Find")
        enabled: splitView.currentView.currentDocument != null
        onTriggered: dialogs.showFindDialog()
    }
    
    Action {
        id: findNextAction
        
        autoRepeat: false
        shortcut: "Ctrl+G"
        text: qsTr("Find next")
        enabled: (splitView.currentView.currentDocument != null) && (dialogs.findDialog != null)
        onTriggered: if (!splitView.currentView.currentDocument.findNext(dialogs.findDialog.findText,
                                                                         dialogs.findDialog.matchCase,
                                                                         dialogs.findDialog.wholeWordsOnly))
                     informationBox.information(qsTr("Pattern not found") + ": " + dialogs.findDialog.findText);
    }
    
    Action {
        id: findPreviousAction
        
        autoRepeat: false
        shortcut: "Shift+Ctrl+G"
        text: qsTr("Find previous")
        enabled: (splitView.currentView.currentDocument != null) && (dialogs.findDialog != null)
        onTriggered: if (!splitView.currentView.currentDocument.findPrevious(dialogs.findDialog.findText,
                                                                             dialogs.findDialog.matchCase,
                                                                             dialogs.findDialog.wholeWordsOnly))
                     informationBox.information(qsTr("Pattern not found") + ": " + dialogs.findDialog.findText);
    }
    
    Action {
        id: replaceAction
        
        autoRepeat: false
        shortcut: "Ctrl+H"
        text: qsTr("Replace")
        enabled: splitView.currentView.currentDocument != null
        onTriggered: dialogs.showReplaceDialog()
    }
    
    Action {
        id: jumpAction
        
        autoRepeat: false
        shortcut: "Ctrl+J"
        text: qsTr("Jump to")
        enabled: splitView.currentView.currentDocument != null
        onTriggered: dialogs.showJumpDialog()
    }
    
    Action {
        id: saveAction
        
        autoRepeat: false
        shortcut: "Ctrl+S"
        text: qsTr("Save")
        enabled: splitView.currentView.currentDocument != null
        onTriggered: splitView.currentView.currentDocument.save()
    }
    
    Action {
        id: saveAsAction
        
        autoRepeat: false
        shortcut: "Shift+Ctrl+S"
        text: qsTr("Save as")
        enabled: splitView.currentView.currentDocument != null
        onTriggered: splitView.currentView.currentDocument.saveAs()
    }
    
    Action {
        id: closeAction
        
        autoRepeat: false
        shortcut: "Ctrl+W"
        text: qsTr("Close")
        enabled: splitView.currentView.currentDocument != null
        onTriggered: splitView.currentView.closeCurrentDocument()
    }
    
    Action {
        id: closeAllAction
        
        autoRepeat: false
        shortcut: "Shift+Ctrl+W"
        text: qsTr("Close all")
        enabled: splitView.currentView.currentDocument != null
        onTriggered: splitView.currentView.closeAllDocuments()
    }
            
    Action {
        id: splitAction
        
        autoRepeat: false
        shortcut: "Ctrl+L"
        text: qsTr("Split view")
        onTriggered: splitView.split = !splitView.split
    }
        
    Settings {
        id: settings
        
        // General
        property bool highlightCurrentLine: false
        property bool showLineNumbers: false
        property bool showRightMargin: false
        property int rightMargin: 80
        property bool wrapText: false
        
        // Font
        property string fontFamily: "Monospace"
        property string fontStyle: "Normal"
        property int fontSize: 16
        
        // Theme
        property color backgroundColor: platformStyle.reversedBackgroundColor
        property color highlightColor: platformStyle.selectionColor
        property color textColor: platformStyle.reversedTextColor
        
        fileName: "/home/user/.config/QMLEdit/QMLEdit.conf"
    }
    
    QtObject {
        id: dialogs
        
        property AboutDialog aboutDialog
        property CloseDialog closeDialog
        property FileDialog fileDialog
        property FindDialog findDialog
        property JumpDialog jumpDialog
        property ReplaceDialog replaceDialog
        property SettingsDialog settingsDialog
        
        function showAboutDialog() {
            if (!aboutDialog) {
                aboutDialog = aboutDialogComponent.createObject(window);
            }
            
            aboutDialog.open();
        }        
        
        function confirmCloseDocument(fileName) {
            if (!closeDialog) {
                closeDialog = closeDialogComponent.createObject(window);
            }
            
            closeDialog.fileName = fileName;
            return closeDialog.exec();
        }
        
        function showFileDialog() {
            if (!fileDialog) {
                fileDialog = fileDialogComponent.createObject(window);
            }
            
            fileDialog.open();
        }
        
        function showFindDialog() {
            if (!findDialog) {
                findDialog = findDialogComponent.createObject(window);
            }
            
            findDialog.open();
        }
        
        function showJumpDialog() {
            if (!jumpDialog) {
                jumpDialog = jumpDialogComponent.createObject(window);
            }
            
            jumpDialog.maximumLine = splitView.currentView.currentDocument.lineCount;
            jumpDialog.currentLine = splitView.currentView.currentDocument.currentLine;
            jumpDialog.open();
        }
        
        function showReplaceDialog() {
            if (!replaceDialog) {
                replaceDialog = replaceDialogComponent.createObject(window);
            }
            
            replaceDialog.open();
        }
        
        function showSettingsDialog() {
            if (!settingsDialog) {
                settingsDialog = settingsDialogComponent.createObject(window);
            }
            
            settingsDialog.open();
        }
    }
    
    Component {
        id: aboutDialogComponent
        
        AboutDialog {}
    }
    
    Component {
        id: closeDialogComponent
        
        CloseDialog {}
    }
    
    Component {
        id: fileDialogComponent
        
        FileDialog {
            onAccepted: splitView.currentView.openDocument(filePath)
        }
    }
    
    Component {
        id: findDialogComponent
        
        FindDialog {
            onAccepted: if (!splitView.currentView.currentDocument.find(findText, matchCase, wholeWordsOnly))
                        informationBox.information(qsTr("Pattern not found") + ": " + findText);
        }
    }
    
    Component {
        id: jumpDialogComponent
        
        JumpDialog {
            onAccepted: splitView.currentView.currentDocument.jumpTo(currentLine);
        }
    }
    
    Component {
        id: replaceDialogComponent
        
        ReplaceDialog {
            onAccepted: if (!splitView.currentView.currentDocument.replace(findText, replaceText, matchCase,
                                                                           wholeWordsOnly))
                        informationBox.information(qsTr("Pattern not found") + ": " + findText);
        }
    }
    
    Component {
        id: settingsDialogComponent
        
        SettingsDialog {}
    }
    
    SplitView {
        id: splitView
        
        anchors {
            fill: parent
            margins: platformStyle.paddingMedium
        }
    }
    
    InformationBox {
        id: informationBox
        
        function information(text) {
            informationLabel.text = text;
            open();
        }
        
        height: informationLabel.height + platformStyle.paddingLarge
        
        Label {
            id: informationLabel
            
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
                margins: platformStyle.paddingLarge
            }
            color: platformStyle.reversedTextColor
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }
    }
    
    onClosing: close.accepted = splitView.closeAllDocuments()
}
