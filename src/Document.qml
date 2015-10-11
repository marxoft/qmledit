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
import org.hildon.utils 1.0

FocusScope {
    id: root
    
    property bool empty: true
    property bool dirty: false
    property string title: documentTitle
    property string documentTitle: qsTr("Untitled")
    property int currentLine
    property int currentColumn
    property int lineCount
    property alias text: textEdit.text
    
    function copy() {
        textEdit.copy()
    }

    function cut() {
        textEdit.cut()
    }
    
    function paste() {
        textEdit.paste()
    }
    
    function clear() {
        textEdit.text = "";
    }
    
    function find(findText, matchCase, wholeWordsOnly) {
        var pattern = findText;
        var modifiers = "";
        
        if (wholeWordsOnly) {
            pattern = "\\b" + pattern + "\\b";
        }
        
        if (!matchCase) {
            modifiers += "i";
        }
        
        var regexp = new RegExp(pattern, modifiers);
        var pos = textEdit.text.search(regexp);
        
        if (pos >= 0) {
            textEdit.cursorPosition = pos;
            textEdit.select(textEdit.cursorPosition, textEdit.cursorPosition + findText.length);
            return true;
        }
        
        return false;
    }
    
    function findNext(findText, matchCase, wholeWordsOnly) {
        var pattern = findText;
        var modifiers = "";
        
        if (wholeWordsOnly) {
            pattern = "\\b" + pattern + "\\b";
        }
        
        if (!matchCase) {
            modifiers += "i";
        }
        
        var regexp = new RegExp(pattern, modifiers);
        var pos = textEdit.text.substring(textEdit.cursorPosition).search(regexp);
        
        if (pos >= 0) {
            textEdit.cursorPosition += pos;
            textEdit.select(textEdit.cursorPosition, textEdit.cursorPosition + findText.length);
            return true;
        }
        
        return false;
    }
    
    function findPrevious(findText, matchCase, wholeWordsOnly) {
        var pattern = findText;
        var modifiers = "";
        
        if (wholeWordsOnly) {
            pattern = "\\b" + pattern + "\\b";
        }
        
        pattern = "(" + pattern + ")";
        
        if (!matchCase) {
            modifiers += "i";
        }
        
        var regexp = new RegExp(pattern, modifiers);
        var substring = textEdit.text.substring(0, textEdit.cursorPosition);
        var match = regexp.exec(substring);

        if (match) {
            var lastMatch = match[match.length - 1];
            
            if (lastMatch) {
                textEdit.cursorPosition = substring.lastIndexOf(lastMatch);
                textEdit.select(textEdit.cursorPosition, textEdit.cursorPosition + findText.length);
                return true;
            }
        }
        
        return false;
    }
    
    function replace(findText, replaceText, matchCase, wholeWordsOnly) {
        var pattern = findText;
        var modifiers = "g";
        
        if (wholeWordsOnly) {
            pattern = "\b" + pattern + "\b";
        }
        
        if (!matchCase) {
            modifiers += "i";
        }
        
        var regexp = new RegExp(pattern, modifiers);
        
        if (regexp.test(textEdit.text)) {
            var pos = textEdit.cursorPosition;
            textEdit.text = textEdit.text.replace(regexp, replaceText);
            textEdit.cursorPosition = pos;
            return true;
        }
        
        return false;
    }
    
    function jumpTo(line) {
        textEdit.cursorPosition = textEdit.positionAt(0, textEdit.lineHeight * line);
    }
    
    function forceActiveFocus() {
        textEdit.forceActiveFocus();
    }
    
    function open(filePath) {
        file.fileName = filePath;
        
        if (file.open(File.ReadOnly)) {
            textEdit.text = file.readAll();
            file.close();
            documentTitle = filePath.substring(filePath.lastIndexOf("/") + 1);
            dirty = false;
        }
    }
    
    function save() {
        if (!file.fileName) {
            saveAs();
            return;
        }
        
        if (file.open(File.WriteOnly)) {
            file.write(textEdit.text);
            file.close();
            documentTitle = file.fileName.substring(file.fileName.lastIndexOf("/") + 1);
            dirty = false;
        }
    }
    
    function saveAs() {
        var saveAsDialog = saveAsDialogComponent.createObject(window);
        saveAsDialog.open();
    }
            
    File {
        id: file
        
        onFileNameChanged: root.empty = false
        onError: informationBox.information(qsTr("File error") + ": " + errorString)
    }
    
    FontMetrics {
        id: fontMetrics
        
        font.family: settings.fontFamily
        font.pointSize: settings.fontSize
    }
    
    Rectangle {
        id: background
        
        anchors {
            fill: parent
            leftMargin: lineNumbersLoader.item ? lineNumbersLoader.item.width : 0
        }
        color: settings.backgroundColor
    }
        
    Flickable {
        id: flickable
        
        function ensureVisible(r) {
            if (contentX >= r.x) {
                contentX = r.x;
            }
            else if (contentX + width <= r.x+r.width) {
                contentX = r.x + r.width - width;
            }
            
            if (contentY >= r.y) {
                contentY = r.y;
            }
            else if (contentY + height <= r.y + r.height) {
                contentY = r.y + r.height - height;
            }
        }
        
        anchors.fill: background
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        horizontalScrollBarPolicy: contentWidth > width ? Qt.ScrollBarAsNeeded : Qt.ScrollBarAlwaysOff
        contentWidth: textEdit.paintedWidth + platformStyle.paddingLarge
        contentHeight: textEdit.paintedHeight + platformStyle.paddingLarge

        TextEdit {
            id: textEdit
                        
            property int lineCount: height / lineHeight
            property int lineHeight: cursorRectangle.height
            property int currentLine: cursorRectangle.y / lineHeight
            property int currentColumn: cursorRectangle.x / fontMetrics.maximumCharacterWidth
            
            width: flickable.width
            color: settings.textColor
            font.family: settings.fontFamily
            font.italic: settings.fontStyle == "Italic"
            font.pointSize: settings.fontSize
            font.weight: settings.fontStyle == "Bold" ? Font.Bold : Font.Normal
            selectionColor: settings.highlightColor
            selectedTextColor: settings.textColor
            textFormat: TextEdit.PlainText
            wrapMode: settings.wrapText ? TextEdit.WordWrap : TextEdit.NoWrap
            onCursorRectangleChanged: flickable.ensureVisible(cursorRectangle)
            onCurrentLineChanged: root.currentLine = currentLine
            onCurrentColumnChanged: root.currentColumn = currentColumn
            onLineCountChanged: root.lineCount = lineCount
            onTextChanged: if (!root.dirty) root.dirty = true;
            
            Loader {
                id: highlightLoader
                
                z: -1
                sourceComponent: settings.highlightCurrentLine ? highlightComponent : undefined
            }            
        }
    }
    
    MouseArea {
        anchors.fill: parent
        onPressed: {
            mouse.accepted = false;
            textEdit.forceActiveFocus();
        }
    }
    
    Loader {
        id: lineNumbersLoader
        
        sourceComponent: settings.showLineNumbers ? lineNumbersComponent : undefined
    }
    
    Loader {
        id: marginLoader

        z: -1
        sourceComponent: settings.showRightMargin ? marginComponent : undefined
    }
        
    Component {
        id: lineNumbersComponent
        
        Rectangle {
            width: textMetrics.width + platformStyle.paddingMedium
            height: root.height
            color: platformStyle.defaultBackgroundColor
            
            TextMetrics {
                id: textMetrics
                
                font.family: settings.fontFamily
                font.pointSize: settings.fontSize
                text: textEdit.lineCount
            }
        
            ListView {
                anchors.fill: parent
                clip: true
                interactive: false
                highlightMoveDuration: 1
                horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
                verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff
                model: textEdit.lineCount
                currentIndex: textEdit.currentLine
                delegate: Label {
                    width: ListView.view.width
                    height: textEdit.lineHeight
                    font.family: settings.fontFamily
                    font.pointSize: settings.fontSize
                    verticalAlignment: Text.AlignVCenter
                    color: ListView.isCurrentItem ? platformStyle.defaultTextColor : platformStyle.secondaryTextColor
                    text: index + 1
                }            
            }
        }
    }
        
    Component {
        id: marginComponent
        
        Rectangle {
            x: settings.rightMargin * fontMetrics.maximumCharacterWidth
            width: 1
            height: root.height
            color: Qt.darker(settings.highlightColor)            
        }
    }
    
    Component {
        id: highlightComponent
        
        Rectangle {        
            y: textEdit.cursorRectangle.y
            width: Math.max(textEdit.width, textEdit.paintedWidth)
            height: textEdit.lineHeight
            color: Qt.darker(settings.highlightColor)
        }
    }
    
    Component {
        id: saveAsDialogComponent
        
        SaveAsDialog {
            fileName: root.documentTitle
            folder: file.fileName ? file.fileName.substring(0, file.fileName.lastIndexOf("/")) : "/home/user/MyDocs"
            onAccepted: {
                file.fileName = folder + "/" + fileName;
                root.save()
            }
            onStatusChanged: if (status == DialogStatus.Closed) destroy();
        }
    }
    
    onDirtyChanged: {
        if (dirty) {
            empty = false;
            title = "*" + documentTitle;
        }
        else {
            empty = file.fileName == "";
            title = documentTitle;
        }
    }
}
