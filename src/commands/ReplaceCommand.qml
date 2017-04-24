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

Command {
    enabled: (documentView.currentDocument) && (documentView.currentDocument.hasOwnProperty("replace"))
    && (!documentView.currentDocument.readOnly)
    onAccepted: {
        var args = input.split("/");
        args.shift();

        if (args.length > 2) {
            var modifiers = args.pop();
            var source = args.shift();

            while ((source.substring(source.length - 1) == "\\") && (args.length)) {
                source += "/" + args.shift();
            }

            var rep = args.shift();

            while ((rep.substring(rep.length - 1) == "\\") && (args.length)) {
                rep += "/" + args.shift();
            }

            documentView.currentDocument.replace(new RegExp(source, modifiers), rep);
            finished();
        }
        else {
            error(qsTr("Please specify a pattern e.g. /foo/bar/g"));
        }
    }
}

