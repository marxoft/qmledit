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

Item {
    id: root

    property string titleText
    property string statusText
    property string messageText

    function showMessage(message, time) {
        if (time === undefined) {
            time = 3000;
        }

        timer.interval = time;
        messageText = message;
        timer.restart();
    }

    function hideMessage() {
        timer.stop();
    }

    height: titleLabel.height + platformStyle.paddingSmall * 2
    visible: (timer.running) || (!commandLoader.item)

    Label {
        id: titleLabel

        anchors {
            left: parent.left
            leftMargin: platformStyle.paddingSmall
            right: statusLabel.visible ? statusLabel.left : parent.right
            rightMargin: platformStyle.paddingSmall
            verticalCenter: parent.verticalCenter
        }
        elide: Text.ElideRight
        font.family: settings.fontFamily
        font.pointSize: settings.fontSize
        text: timer.running ? root.messageText : root.titleText
    }

    Label {
        id: statusLabel

        anchors {
            right: parent.right
            rightMargin: platformStyle.paddingSmall
            verticalCenter: parent.verticalCenter
        }
        font: titleLabel.font
        text: root.statusText
        visible: !timer.running
    }

    Timer {
        id: timer

        interval: 3000
        repeat: false
    }
}

