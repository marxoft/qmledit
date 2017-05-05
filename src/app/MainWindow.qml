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
import org.hildon.settings 1.0
import "definitions.js" as Definitions

Window {
    id: window

    property alias currentTheme: themes.currentTheme

    function createComponent(url) {
        return Qt.createComponent(url);
    }

    function createQmlObject(qml, parent, filepath) {
        return Qt.createQmlObject(qml, parent, filepath);
    }

    title: statusBar.titleText + " - QMLEdit"

    Action {
        id: commandAction

        text: qsTr("Open command")
        shortcut: settings.commandShortcut
        autoRepeat: false
        onTriggered: commandLoader.item ? commandLoader.item.forceActiveFocus() :
        commandLoader.sourceComponent = commandLine
    }

    DocumentView {
        id: documentView

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: statusBar.visible ? statusBar.top : commandLoader.top
        }
        tabBarVisible: (settings.showTabBar) && (count > 1)
        onError: statusBar.showMessage(errorString)
        onInformation: statusBar.showMessage(message);
    }

    StatusBar {
        id: statusBar

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        titleText: documentView.currentDocument ? (documentView.currentDocument.modified ? "+ " : "") +
        documentView.currentDocument.title : qsTr("No document")
        statusText: documentView.currentDocument ? documentView.currentDocument.statusText : ""
    }

    Loader {
        id: commandLoader

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        onItemChanged: if (!item) documentView.forceActiveFocus();
    }

    Component {
        id: commandLine

        CommandLine {
            onCanceled: {
                statusBar.showMessage(qsTr("Command canceled"));
                commandLoader.sourceComponent = undefined;
            }
            onError: statusBar.showMessage(errorString)
            onInformation: statusBar.showMessage(message)
            onFinished: commandLoader.sourceComponent = undefined
            onInputChanged: statusBar.hideMessage()
            onVisibleChanged: if (visible) forceActiveFocus();
            Component.onCompleted: {
                statusBar.hideMessage();
                forceActiveFocus();
            }
        }
    }

    Commands {
        id: commands
    }

    SyntaxHighlighters {
        id: highlighters
    }

    Themes {
        id: themes
    }

    Settings {
        id: settings
        
        // General
        property bool highlightCurrentLine: false
        property bool showLineNumbers: false
        property bool syntaxHighlighting: true
        property bool wrapText: false
        property bool showTabBar: true
        property bool fullScreen: false
        property bool showHelpOnStartup: true
        property string commandShortcut: qsTr("Ctrl+.")
        
        // Font
        property string fontFamily: platformStyle.fontFamily
        property int fontSize: 16

        // Theme
        property string theme: "Default"
        
        fileName: Definitions.APP_CONFIG_FILE
        onFullScreenChanged: fullScreen ? window.showFullScreen() : window.showNormal()
        onThemeChanged: themes.setCurrentTheme(settings.theme)
    }

    onClosing: {
        var document = documentView.findDocument("modified", true);

        if (document) {
            activate();
            statusBar.showMessage(qsTr("One or more documents have unsaved changes"));
            close.accepted = false;
        }
        else {
            close.accepted = true;
        }
    }
    Component.onCompleted: {
        Qt.application.organization = "QMLEdit";
        Qt.application.name = "QMLEdit";
        Qt.application.version = Definitions.VERSION_NUMBER;
        commands.load();
        highlighters.load();
        themes.load();
        themes.setCurrentTheme(settings.theme);
        var args = Qt.application.arguments;

        for (var i = 2; i < args.length; i++) {
            documentView.openDocument(args[i]);
        }

        if ((!documentView.count) && (settings.showHelpOnStartup)) {
            documentView.addDocument(Qt.createComponent(Qt.resolvedUrl("HelpDocument.qml")));
        }

        if (settings.fullScreen) {
            showFullScreen();
        }
        else {
            showNormal();
        }
    }
}

