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
import org.hildon.utils 1.0

/*!
 * \class TextEditDocument
 * \brief The standard document used for text editing in QMLEdit.
 *
 * The TextEditDocument class is used as the standard document for text editing
 * in QMLEdit.
 */
Document {
    id: root

    /*!
     * Whether the current line of the document should be highlighted.
     */
    property bool highlightCurrentLine: settings.highlightCurrentLine

    /*!
     * Whether the line numbers should be displayed.
     */
    property bool showLineNumbers: settings.showLineNumbers

    /*!
     * The line on which the cursor is displayed.
     */
    property int currentLine

    /*!
     * The column at which the cursor is displayed.
     */
    property int currentColumn

    /*!
     * The syntax highlighter to be used by the document.
     */
    property SyntaxHighlighter syntaxHighlighter

    /*!
     * \type:int
     * The current position of the cursor.
     */
    property alias cursorPosition: textEdit.cursorPosition

    /*!
     * \type:rect
     * The rectangle of the cursor.
     */
    property alias cursorRectangle: textEdit.cursorRectangle

    /*!
     * \type:bool
     * Whether the cursor is currently visible.
     */
    property alias cursorVisible: textEdit.cursorVisible

    /*!
     * \type:font
     * The font used by the document.
     */
    property alias font: textEdit.font

    /*!
     * \type:enumeration
     * The horizontal alignment of text in the document.
     */
    property alias horizontalAlignment: textEdit.horizontalAlignment

    /*!
     * \type:enumeration
     * The vertical alignment of text in the document.
     */
    property alias verticalAlignment: textEdit.verticalAlignment

    /*!
     * \type:bool
     * Whether the document is read-only.
     */
    property alias readOnly: textEdit.readOnly

    /*!
     * \type:bool
     * Whether text is selectable using a mouse.
     */
    property alias selectByMouse: textEdit.selectByMouse

    /*!
     * \type:string
     * The currently selected text.
     */
    property alias selectedText: textEdit.selectedText

    /*!
     * \type:int
     * The start position of the currently selected text.
     */
    property alias selectionStart: textEdit.selectionStart

    /*!
     * \type:int
     * The end position of the currently selected text.
     */
    property alias selectionEnd: textEdit.selectionEnd

    /*!
     * \type:string
     * The current text of the document.
     */
    property alias text: textEdit.text

    /*!
     * \type:enumeration
     * The text formatting used by the document.
     */
    property alias textFormat: textEdit.textFormat

    /*!
     * \type:enumeration
     * The mode used to wrap text in the document.
     */
    property alias wrapMode: textEdit.wrapMode

    /*!
     * \type:int
     * The number of lines of text in the document.
     */
    property alias lineCount: document.lineCount

    /*!
     * \type:bool
     * Whether the document has been modified.
     */
    property alias modified: document.modified

    /*!
     * \type:string
     * The filename used by the document.
     */
    property alias fileName: info.fileName

    /*!
     * Copies the selected text to the clipboard.
     */
    function copy() {
        textEdit.copy()
    }

    /*!
     * Removes the selected text and copies it to the clipboard.
     */
    function cut() {
        textEdit.cut()
    }

    /*!
     * Pastes text from the clipboard into the document at the current cursor position.
     */
    function paste() {
        textEdit.paste()
    }

    /*!
     * Undoes the last edit operation.
     */
    function undo() {
        document.undo();
    }

    /*!
     * Redoes the last edit operation.
     */
    function redo() {
        document.redo();
    }

    /*!
     * Clears any text in the document.
     */
    function clear() {
        textEdit.text = "";
    }

    /*!
     * Selects the text between the \a start and \a end positions.
     *
     * @param type:int start
     * @param type:int end
     */
    function select(start, end) {
        textEdit.select(start, end)
    }

    /*!
     * Selects all of the text in the document.
     */
    function selectAll() {
        textEdit.selectAll()
    }

    /*!
     * Selects the word under the cursor.
     */
    function selectWord() {
        textEdit.selectWord()
    }

    /*!
     * Searches for \a pattern, starting from \a position.
     *
     * If \a pattern is a string, it will be converted to a RegExp.
     *
     * If \a searchBackwards is \c true, the search moves backwards from \a position.
     *
     * Returns \c true if a match is found.
     *
     * @param type:RegExp pattern
     * @param type:int position
     * @param type:bool searchBackwards
     * @return type:bool
     */
    function find(pattern, position, searchBackwards) {
        if (typeof pattern === "string") {
            if (/\/*\/[gim]*/.test(pattern)) {
                var i = pattern.lastIndexOf("/");
                pattern = new RegExp(pattern.substring(1, i), pattern.substring(i + 1) + "g");
            }
            else {
                pattern = new RegExp(pattern, "g");
            }
        }

        if (!position) {
            position = 0;
        }

        if (!searchBackwards) {
            pattern.lastIndex = position;
        }

        var result = pattern.exec(textEdit.text);

        if ((result) && ((!searchBackwards) || (result.index < position))) {
            textEdit.cursorPosition = result.index;
            textEdit.select(result.index, result.index + result[0].length);

            if (syntaxHighlighter) {
                searchHighlighter.pattern = pattern.source;
                searchHighlighter.modifiers = "g" + (pattern.ignoreCase ? "i" : "");
                syntaxHighlighter.highlightText.connect(searchHighlighter.highlight);
                syntaxHighlighter.rehighlight();
                syntaxHighlighter.highlightText.disconnect(searchHighlighter.highlight);
                textEdit.textChanged.connect(searchHighlighter.clear);
            }

            return true;
        }

        error(qsTr("Pattern not found") + ": " + pattern.source);
        return false;
    }

    /*!
     * Appends \a text to the document.
     *
     * @param type:string text
     */
    function append(text) {
        var count = lineCount;
        var length = textEdit.text.length;
        document.append(text);
        count = lineCount - count;
        length = textEdit.text.length - length;
        information(count + "L, " + length + "C " + qsTr("inserted"));
    }

    /*!
     * Inserts \a text at \a position in the document.
     *
     * @param type:int position
     * @param type:string text
     */
    function insert(position, text) {
        var count = lineCount;
        var length = textEdit.text.length;
        document.insert(position, text);
        count = lineCount - count;
        length = textEdit.text.length - length;
        information(count + "L, " + length + "C " + qsTr("inserted"));
    }

    /*!
     * Removes the text between the \a start and \a end positions from the document, and returns it.
     *
     * @param type:int start
     * @param type:int end
     * @return type:string
     */
    function remove(start, end) {
        var count = lineCount;
        var length = text.length;
        document.remove(start, end);
        count -= lineCount;
        length -= text.length;
        information(count + "L, " + length + "C " + qsTr("removed"));
    }

    /*!
     * Replaces text matching \a pattern with \a replacementText.
     *
     * If \a pattern is a string, it will be converted to a RegExp.
     *
     * Returns \a true if any matches were found.
     *
     * @param type:RegExp pattern
     * @param type:string replacementText
     * @return type:bool
     */
    function replace(pattern, replacementText) {
        if (typeof pattern !== "RegExp") {
            pattern = new RegExp(pattern);
        }

        var count = 0;
        var res;

        while (res = pattern.exec(textEdit.text)) {
            document.remove(res.index, res.index + res[0].length);
            document.insert(res.index, replacementText);
            pattern.lastIndex = res.index + replacementText.length;
            ++count;

            if (!pattern.global) {
                break;
            }
        }

        if (count) {
            information(count + " " + qsTr("replacements made"));
            return true;
        }

        error(qsTr("Pattern not found") + ": " + pattern.source);
        return false;
    }

    /*!
     * Returns the plain text between the \a start and \a end positions.
     *
     * @param type:int start
     * @param type:int end
     * @return type:string
     */
    function getText(start, end) {
        return document.text(start, end);
    }

    /*!
     * Returns the formatted text between the \a start and \a end positions.
     *
     * @param type:int start
     * @param type:int end
     * @return type:string
     */
    function getFormattedText(start, end) {
        return document.formattedText(start, end);
    }

    /*!
     * Moves the cursor to \a line.
     *
     * @param type:int line
     */
    function jumpTo(line) {
        textEdit.cursorPosition = document.position(line, 0);
    }

    /*!
     * Opens the file at \a filePath and reads its contents into the document.
     *
     * Returns \c true if the operation is successful.
     *
     * @param type:string filePath
     * @return type:bool
     */
    function open(filePath) {
        var oldFileName = info.file;
        info.file = filePath;

        if (info.exists) {
            file.fileName = info.absoluteFilePath;

            if (file.open(File.ReadOnly)) {
                text = file.readAll();
                file.close();
                document.modified = false;
                return true;
            }

            info.file = oldFileName;
            error(qsTr("Error reading file") + ": " + filePath);
            return false;
        }

        clear();
        document.modified = false;
        return true;
    }

    /*!
     * Writes the contents of the document to the file at \a filePath.
     *
     * If \a filePath is empty, the document's existing filepath is used.
     *
     * Returns \c true if the operation is successful.
     *
     * @param type:string filePath
     * @return type:bool
     */
    function save(filePath) {
        var oldFileName = info.file;

        if (filePath) {
            info.file = filePath;
        }

        file.fileName = info.absoluteFilePath;

        if (!file.fileName) {
            info.file = oldFileName;
            error(qsTr("Filename is empty"));
            return false;
        }

        if ((dir.mkpath(info.absolutePath)) && (file.open(File.WriteOnly))) {
            file.write(text);
            file.close();
            document.modified = false;
            information(fileName + " " + lineCount + "L, " + text.length + "C " + qsTr("written"));
            return true;
        }

        info.file = oldFileName;
        error(qsTr("Error writing to file") + ": " + filePath);
        return false;
    }

    /*!
     * Forces the document to obtain keyboard focus.
     */
    function forceActiveFocus() {
        textEdit.forceActiveFocus();
    }
    
    title: fileName ? fileName : qsTr("[No Name]")
    statusText: (currentLine + 1) + "/" + lineCount + "," + currentColumn

    Rectangle {
        id: background
        
        anchors {
            left: lineNumbersLoader.item ? lineNumbersLoader.right : parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        color: currentTheme.textFormat.backgroundColor
    }

    Flickable {
        id: flickable
        
        function ensureVisible(r) {
            if (contentX >= r.x) {
                contentX = r.x;
            }
            else if (contentX + width <= r.x + r.width) {
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
        boundsBehavior: Flickable.StopAtBounds
        contentWidth: textEdit.paintedWidth
        contentHeight: textEdit.paintedHeight
        pressDelay: 250

        TextEdit {
            id: textEdit

            width: flickable.width
            color: currentTheme.textFormat.color
            font: currentTheme.textFormat.font
            selectionColor: currentTheme.selectionFormat.backgroundColor
            selectedTextColor: currentTheme.selectionFormat.color
            textFormat: TextEdit.PlainText
            wrapMode: settings.wrapText ? TextEdit.Wrap : TextEdit.NoWrap
            selectByMouse: true
            onCursorRectangleChanged: flickable.ensureVisible(cursorRectangle)
            onCursorPositionChanged: {
                root.currentLine = document.lineNumber(cursorPosition);
                root.currentColumn = document.columnNumber(cursorPosition);
            }

            Loader {
                id: highlightLoader
                
                z: -1
                sourceComponent: root.highlightCurrentLine ? highlightComponent : undefined
            } 

            MouseArea {
                id: mouseArea

                anchors.fill: parent
                onPressed: mouse.accepted = false
            }
        }
    }

    TextDocument {
        id: document

        target: textEdit
    }

    Loader {
        id: lineNumbersLoader
        
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        sourceComponent: root.showLineNumbers ? lineNumbersComponent : undefined
    }
           
    Component {
        id: lineNumbersComponent
        
        Rectangle {
            width: textMetrics.width + platformStyle.paddingSmall * 2
            color: currentTheme.lineNumbersFormat.backgroundColor
            
            TextMetrics {
                id: textMetrics
                
                font.family: settings.fontFamily
                font.pointSize: settings.fontSize
                text: Math.max(9999, document.lineCount)
            }

            ListView {
                anchors{
                    fill: parent
                    leftMargin: platformStyle.paddingSmall
                    rightMargin: platformStyle.paddingSmall
                }
                interactive: false
                contentY: flickable.contentY
                model: document.lineCount
                delegate: Label {
                    width: ListView.view.width
                    height: document.lineHeight(index)
                    horizontalAlignment: Text.AlignRight
                    color: currentTheme.lineNumbersFormat.color
                    font: currentTheme.lineNumbersFormat.font
                    text: index + 1
                }
            }
        }
    }
    
    Component {
        id: highlightComponent
        
        Rectangle {        
            y: textEdit.cursorRectangle.y
            width: Math.max(textEdit.width, textEdit.paintedWidth)
            height: textEdit.cursorRectangle.height
            color: currentTheme.currentLineFormat.backgroundColor
        }
    }

    Component {
        id: defaultSyntaxHighlighter

        SyntaxHighlighter {}
    }

    QtObject {
        id: searchHighlighter

        property string pattern
        property string modifiers

        function highlight(text) {
            var reg = new RegExp(pattern, modifiers);
            var res;

            while (res = reg.exec(text)) {
                syntaxHighlighter.setFormat(res.index, res[0].length, currentTheme.searchMatchFormat);
                reg.lastIndex = res.index + res[0].length;
            }
        }

        function clear() {
            pattern = "";
            modifiers = "";
            textEdit.textChanged.disconnect(searchHighlighter.clear);
            syntaxHighlighter.rehighlight();
        }
    }

    Directory {
        id: dir
    }

    FileInfo {
        id: info
    }

    File {
        id: file
    }

    Connections {
        target: settings
        onSyntaxHighlightingChanged: {
            if (settings.syntaxHighlighting) {
                syntaxHighlighter = highlighters.create(info.fileName, root)
                || defaultSyntaxHighlighter.createObject(root);
            }
            else if (syntaxHighlighter) {
                syntaxHighlighter.destroy();
            }
        }
    }

    onFileNameChanged: {
        if (settings.syntaxHighlighting) {
            if (syntaxHighlighter) {
                syntaxHighlighter.destroy();
            }

            syntaxHighlighter = highlighters.create(info.fileName, root)
            || defaultSyntaxHighlighter.createObject(root);
        }
    }

    onSyntaxHighlighterChanged: {
        if (syntaxHighlighter) {
            syntaxHighlighter.autoRehighlight = false;
            syntaxHighlighter.textDocument = document.textDocument;
            themes.currentThemeChanged.connect(syntaxHighlighter.rehighlight);
        }
    }

    Component.onCompleted: if (!textEdit.text) document.modified = false;
}

