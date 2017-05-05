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

/*!
 * \class Commmand
 * \brief The base class for QMLEdit commands.
 *
 * The Command class is used for extending the programmatic functionality of QMLEdit.
 *
 * In addition to the properties, functions and signals of the Command class, commands
 * may use the following:
 *
 * The 'window' property: The main application window.
 * The 'documentView' property: The container for all Document items (see the DocumentView class).
 * The 'currentTheme' property: The currently active theme (see the Theme class).
 *
 * To create custom documents, use the Document and TextEditDocument classes.
 *
 * \sa Document, TextEditDocument, DocumentView, Theme
 */
Object {
    id: root

    /*!
     * Whether the command is currently enabled.
     *
     * Set this value to \c false if you want to prevent the command being used.
     *
     * The default value is \c true.
     */
    property bool enabled: true

    /*!
     * The text used to display any input hints.
     *
     * Changes made to this property will be reflected in the UI.
     */
    property string label

    /*!
     * The input string.
     *
     * Changes made to this property will be reflected in the UI.
     */
    property string input

    /*!
     * This signal is emitted when the input has been submitted by the user.
     *
     * This signal should be handled to perform any work, e.g:
     *
     * \code
     * ...
     * MyCommand {
     *     onAccepted: {
     *         if (input) {
     *             // process input
     *             finished();
     *         }
     *         else {
     *             error("No input. Please try again");
     *         }
     *     }
     * }
     * \endcode
     */
    signal accepted

    /*!
     * This signal should be emitted when any work is canceled.
     */
    signal canceled

    /*!
     * This signal should be emitted when an error occurs.
     */
    signal error(string errorString)

    /*!
     * This signal should be emitted when a message is to be displayed to the user.
     */
    signal information(string message)

    /*!
     * This signal should be emitted when any work is finished.
     */
    signal finished

    /*!
     * Creates a Component from \a url.
     *
     * Commands should this function instead of Qt.createComponent() to ensure that the
     * component remains valid after the command object is destroyed.
     */
    function createComponent(url) {
        return window.createComponent(url);
    }

    /*!
     * Creates a QML object from the string \a qml with parent \a parent.
     *
     * Commands should use this function instead of Qt.createQmlObject() to ensure that the
     * component used to create the object remains valid after the command object is destroyed.
     */
    function createQmlObject(qml, parent, filepath) {
        return window.createQmlObject(qml, parent, filepath);
    }
}

