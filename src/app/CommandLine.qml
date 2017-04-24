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
import "../commands"

FocusScope {
    id: root

    property alias label: textLabel.text
    property alias input: textInput.text

    property Command command

    signal canceled
    signal error(string errorString)
    signal finished
    signal information(string message)

    function forceActiveFocus() {
        textInput.forceActiveFocus();
    }

    height: textLabel.height + platformStyle.paddingSmall * 2
    opacity: statusBar.visible ? 0 : 1

    Label {
        id: textLabel

        anchors {
            left: parent.left
            leftMargin: platformStyle.paddingSmall
            verticalCenter: parent.verticalCenter
        }
        font.family: settings.fontFamily
        font.pointSize: settings.fontSize
        text: ":"
        onTextChanged: if (command) command.label = text;
    }

    TextInput {
        id: textInput

        anchors {
            left: textLabel.right
            leftMargin: platformStyle.paddingSmall
            right: parent.right
            rightMargin: platformStyle.paddingSmall
            verticalCenter: parent.verticalCenter
        }
        color: textLabel.color
        font: textLabel.font
        onTextChanged: if (command) command.input = text;
        Keys.onPressed: {
            if (!event.autoRepeat) {
                if (event.key == Qt.Key_Enter) {
                    if (command) {
                        command.accepted();
                        event.accepted = true;
                        return;
                    }

                    var i = text.search(/\s|$/);
                    var name = text.substring(0, i);
                    text = text.substring(i + 1);
                    command = commands.create(name, root, {label: textLabel.text, input: text});

                    if (command) {
                        if (command.enabled) {
                            command.canceled.connect(root.canceled);
                            command.error.connect(root.error);
                            command.finished.connect(root.finished);
                            command.information.connect(root.information);
                            command.inputChanged.connect(function() { textInput.text = command.input; });
                            command.labelChanged.connect(function() { textLabel.text = command.label; });
                            command.accepted();
                        }
                        else {
                            root.error(qsTr("Command not enabled") + ": " + name);
                            root.finished();
                        }
                    }
                    else {
                        root.error(qsTr("Error creating command object"));
                        root.finished();
                    }

                    event.accepted = true;
                }
                else if (event.key == Qt.Key_Backspace) {
                    if (!text) {
                        root.canceled();
                    }
                }
            }
        }
    }
}

