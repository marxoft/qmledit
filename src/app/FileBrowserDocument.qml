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
import org.hildon.utils 1.0

TextEditDocument {
    id: root

    property alias path: directory.path

    signal selected(string filePath)
    
    title: qsTr("File browser")
    statusText: directory.count + " " + qsTr("items")
    highlightCurrentLine: true
    showLineNumbers: false
    selectByMouse: false
    readOnly: true
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
                var path = directory.absoluteFilePath(directory.files[currentLine]);
                info.file = path;

                if (info.isDir) {
                    directory.path = path;
                }
                else {
                    selected(path)
                }
            }

            break;
            default:
            return;
        }

        event.accepted = true;
    }

    Directory {
        id: directory

        property variant files

        filter: Directory.Readable | Directory.Files | Directory.Dirs | Directory.NoDot
        sorting: Directory.DirsFirst | Directory.Name | Directory.IgnoreCase
        onPathChanged: {
            files = entryList();
            root.text = files.join("\n");
            root.title = absolutePath;
            root.modified = false;
        }
    }

    FileInfo {
        id: info
    }
}

