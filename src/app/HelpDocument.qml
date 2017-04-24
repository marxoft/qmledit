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
import "definitions.js" as Definitions

TextEditDocument {
    title: qsTr("Help")
    highlightCurrentLine: false
    showLineNumbers: false
    textFormat: TextEdit.RichText
    wrapMode: Text.Wrap
    Component.onCompleted: {
        var t = "<img src='/usr/share/icons/hicolor/48x48/apps/qmledit.png' />"
        + "<p style='font-weight: bold'>QMLEdit " + Definitions.VERSION_NUMBER + "</p>"
        + "<p>A text editor written in QML using Qt Components Hildon.</p><p>&copy; Stuart Howarth</p>"
        + "<p><a href='#commands'>Commands</a></p><p>Press " + commandAction.shortcut
        + " to switch to the command line.</p><table><tr><th>Name</th><th>Description</th></tr>";

        for (var i = 0; i < commands.plugins.length; i++) {
            var command = commands.plugins[i];
            t += "<tr><td>" + command.name + "</td><td>" + command.description + "</td></tr>";
        }

        t += "</table><p><a href='#highlighters'>Syntax highlighters</a></p><table><tr><th>Name</th><th>Globs</th></tr>";

        for (var i = 0; i < highlighters.plugins.length; i++) {
            var highlighter = highlighters.plugins[i];
            t += "<tr><td>" + highlighter.name + "</td><td>" + highlighter.globs.join(", ") + "</td></tr>";
        }

        t += "</table><p><a href='#themes'>Themes</a></p><table><tr><th>Name</th><th>Description</th></tr>";

        for (var i = 0; i < themes.plugins.length; i++) {
            var theme = themes.plugins[i];
            t += "<tr><td>" + theme.name + "</td><td>" + theme.description + "</td></tr>";
        }

        t += "</table>";
        text = t;
        modified = false;
    }
}

