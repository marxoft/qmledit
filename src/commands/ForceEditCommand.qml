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

Command {
    enabled: documentView.currentDocument != null
    onAccepted: {
        if (documentView.currentDocument.readOnly) {
            error(qsTr("Document is read-only"));
        }
        else if (typeof documentView.currentDocument["open"] != "function") {
            error(qsTr("Document can not be used to edit files"));
        }
        else if (input) {
            info.file = input;

            if (info.isDir) {
                var view = documentView;
                var document = view.currentDocument;
                var browser =
                    documentView.addDocument(createComponent(Qt.resolvedUrl("../app/FileBrowserDocument.qml")));
                browser.path = info.absoluteFilePath;
                browser.selected.connect(document.open);
                browser.selected.connect(function() {
                    view.currentIndex = view.indexOf(document);
                    view.removeDocument(browser);
                });
            }
            else {
                documentView.currentDocument.open(info.absoluteFilePath);
            }
        }
        else {
            documentView.currentDocument.open();
        }

        finished();
    }

    FileInfo {
        id: info
    }
}

