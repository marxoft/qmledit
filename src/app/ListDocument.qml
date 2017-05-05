/*
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

TextEditDocument {
    property variant documents

    signal removeRequested(int index)
    signal selected(int index)

    title: qsTr("Document list")
    statusText: lineCount + " " + qsTr("documents")
    highlightCurrentLine: true
    showLineNumbers: false
    selectByMouse: false
    readOnly: true
    onDocumentsChanged: {
        var titles = [];

        for (var i = 0; i < documents.length; i++) {
            titles.push(documents[i].title);
        }

        text = titles.join("\n");
        modified = false;
    }
    Keys.onPressed: {
        switch (event.key) {
            case Qt.Key_Up:
            jumpTo(Math.max(0, currentLine - 1));
            break;
            case Qt.Key_Down:
            jumpTo(Math.min(lineCount - 1, currentLine + 1));
            break;
            case Qt.Key_Enter:
            if (!event.autoRepeat) {
                selected(currentLine);
            }

            break;
            case Qt.Key_Q:
            if (!event.autoRepeat) {
                removeRequested(currentLine);
            }

            break;
            default:
            return;
        }

        event.accepted = true;
    }
}

