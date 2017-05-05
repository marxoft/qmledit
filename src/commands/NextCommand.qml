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
    enabled: documentView.count > 1
    onAccepted: {
        if (input) {
            var i = parseInt(input);

            if ((!isNaN(i)) && (i > 0) && (i <= documentView.count)) {
                documentView.currentIndex = i - 1;
            }
            else {
                error(qsTr("Please enter a valid index") + " (1-" + documentView.count + ")");
                return;
            }
        }
        else if (documentView.currentIndex < documentView.count - 1) {
            documentView.currentIndex += 1;
        }
        else {
            documentView.currentIndex = 0;
        }

        finished();
    }
}

