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
    onAccepted: {
        var args = input.split(/\s+/);
        var prop = args.shift();

        if (!prop) {
            documentView.addDocument(createComponent(Qt.resolvedUrl("../app/SettingsDocument.qml")));
        }
        else if (settings.hasOwnProperty(prop)) {
            if (args.length > 0) {
                try {
                    settings[prop] = args.join(" ");
                    information(prop + " = " + settings[prop].toString());
                }
                catch(e) {
                    console.log(e);
                    error(qsTr("Unable to set property") + ": " + prop);
                }
            }
            else {
                information(prop + " = " + settings[prop].toString());
            }
        }
        else {
            error(qsTr("Property not found") + ": " + prop);
        }

        finished();
    }
}

