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
 * \class DocumentView
 * \brief The item used to display documents in QMLEdit.
 *
 * The DocumentView class is a tabbed item used to display documents in QMLEdit.
 */
FocusScope {
    id: root

    /*!
     * \internal
     * \type:Item
     * The container item in which the documents are displayed.
     */
    property alias contentItem: view.contentItem

    /*!
     * \type:int
     * The number of documents in the view.
     */
    property alias count: view.count

    /*!
     * \type:list<Document>
     * The list of documents in the view.
     */
    property alias documents: view.tabs

    /*!
     * \type:int
     * The index of the current document in the view.
     */
    property alias currentIndex: view.currentIndex

    /*!
     * \type:Document
     * The currently displayed document in the view.
     */
    property alias currentDocument: view.currentTab

    /*!
     * \type:bool
     * Whether the tab bar of the view is displayed.
     */
    property alias tabBarVisible: view.tabBarVisible

    /*!
     * \internal
     * This signal is emitted when an error occurs.
     */
    signal error(string errorString)

    /*!
     * \internal
     * This signal is emitted when some information is to be displayed.
     */
    signal information(string message)

    /*!
     * Creates a document using \a component, adds it to the view, and returns it.
     *
     * If no component is specified, a default TextEditDocument is used.
     *
     * @param type:Component component
     * @return type:Document
     */
    function addDocument(component) {
        if (!component) {
            component = textDocument;
        }

        var document = component.createObject(contentItem);
        document.error.connect(root.error);
        document.information.connect(root.information);
        currentIndex = count - 1;
        return document;
    }

    /*!
     * Return the document where the value of property \a prop is equal to \a val.
     *
     * If no document is found, \c null is returned.
     *
     * @param type:string prop
     * @param type:variant val
     * @return type:Document
     */
    function findDocument(prop, val) {
        for (var i = 0; i < count; i++) {
            var document = getDocument(i);

            if ((document) && (document[prop] === val)) {
                return document;
            }
        }

        return null;
    }

    /*!
     * Returns the document at \a index.
     *
     * @param type:int index
     * @return type:Document
     */
    function getDocument(index) {
        return view.getTab(index);
    }

    /*!
     * Adds a document and sets its text to the content of the file at \a filePath.
     *
     * If \a filePath points to a directory, a file browser is displayed.
     *
     * @param type:string filePath
     * @return type:Document
     */
    function openDocument(filePath) {
        info.file = filePath;

        if (info.isDir) {
            addDocument(fileBrowser);
            return true;
        }

        return addDocument().open(filePath);
    }

    /*!
     * Writes the contents of \a document to the file at \a filePath.
     *
     * Returns \c true if the operation is successful.
     *
     * @param type:Document document
     * @param type:string filePath
     * @return type:bool
     */
    function saveDocument(document, filePath) {
        try {
            return document.save(filePath);
        }
        catch(e) {
            error(qsTr("Document cannot be saved"));
            return false;
        }
    }

    /*!
     * Removes the \a document from the view and destroys it.
     *
     * Returns \c true if the document exists in the view.
     *
     * @param type:Document document
     * @return type:bool
     */
    function removeDocument(document) {
        for (var i = 0; i < count; i++) {
            if (getDocument(i) === document) {
                view.removeTab(i);
                return true;
            }
        }

        return false;
    }

    /*!
     * Displays a list of the documents in the view.
     */
    function showDocumentList() {
        return addDocument(listDocument);
    }

    /*!
     * Forces the current document in the view to obtain keyboard focus.
     */
    function forceActiveFocus() {
        if (currentDocument) {
            currentDocument.forceActiveFocus();
        }
    }

    TabView {
        id: view

        anchors.fill: parent
        frameVisible: false
    }

    Component {
        id: textDocument

        TextEditDocument {}
    }

    Component {
        id: listDocument

        ListDocument {
            id: list

            onRemoveRequested: {
                var document = root.getDocument(index);
                
                if (!document.modified) {
                    root.removeDocument(document);
                }
                else {
                    root.error(qsTr("Document has unsaved changes"));
                }
            }
            onSelected: {
                root.currentIndex = index;
                root.removeDocument(list);
            }
        }
    }

    Component {
        id: fileBrowser

        FileBrowserDocument {
            id: browser

            path: info.absoluteFilePath
            onSelected: {
                root.openDocument(filePath);
                root.removeDocument(browser);
            }
        }
    }

    FileInfo {
        id: info
    }
}

