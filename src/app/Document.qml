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

/*!
 * \class Document
 * \brief The base class for QMLEdit documents.
 *
 * The Document class is used for defining custom documents when extending QMLEdit.
 *
 * If you wish to create a custom document for text editing, subclassing TextEditDocument
 * may be the best option.
 *
 * \sa TextEditDocument
 */
FocusScope {
    id: root

    /*!
     * The title of the document.
     */
    property string title: qsTr("[No Name]")

    /*!
     * The status text of the document.
     */
    property string statusText

    /*!
     * This signal should be emitted when an error occurs.
     */
    signal error(string errorString)

    /*!
     * This signal should be emitted when some information is to be displayed to the user.
     */
    signal information(string message)

    anchors.fill: parent ? parent : undefined
    clip: true
}

