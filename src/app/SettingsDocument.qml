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

TextEditDocument {
    title: qsTr("Settings")
    highlightCurrentLine: false
    showLineNumbers: false
    textFormat: TextEdit.RichText
    readOnly: true
    Component.onCompleted: {
        text = "<a href='#general'>General</a><p>highlightCurrentLine: " + settings.highlightCurrentLine
        + "<br>showLineNumbers: " + settings.showLineNumbers + "<br>syntaxHighlighting: " + settings.syntaxHighlighting         + "<br>wrapText: " + settings.wrapText + "<br>showTabBar: " + settings.showTabBar
        + "<br>showHelpOnStartup: " + settings.showHelpOnStartup + "<br>fullScreen: " + settings.fullScreen
        + "<br>commandShortcut: " + settings.commandShortcut
        + "</p><a href='#font'>Font</a><p>fontFamily: " + settings.fontFamily + "<br>fontSize: " + settings.fontSize
        + " pt</p><a href='#theme'>Theme</a><p>theme: " + settings.theme + "</p>";
        modified = false;
    }
}

