TEMPLATE = subdirs

app.files = \
    src/app/CommandLine.qml \
    src/app/Commands.qml \
    src/app/definitions.js \
    src/app/Document.qml \
    src/app/DocumentView.qml \
    src/app/FileBrowserDocument.qml \
    src/app/HelpDocument.qml \
    src/app/ListDocument.qml \
    src/app/MainWindow.qml \
    src/app/SettingsDocument.qml \
    src/app/StatusBar.qml \
    src/app/SyntaxHighlighters.qml \
    src/app/TextEditDocument.qml \
    src/app/Themes.qml

app.path = /opt/qmledit/app

commands.files = \
    src/commands/CloseAllCommand.json \
    src/commands/CloseAllCommand.qml \
    src/commands/CloseCommand.json \
    src/commands/CloseCommand.qml \
    src/commands/Command.qml \
    src/commands/EditCommand.json \
    src/commands/EditCommand.qml \
    src/commands/FindNextCommand.json \
    src/commands/FindNextCommand.qml \
    src/commands/FindPreviousCommand.json \
    src/commands/FindPreviousCommand.qml \
    src/commands/ForceCloseAllCommand.json \
    src/commands/ForceCloseAllCommand.qml \
    src/commands/ForceCloseCommand.json \
    src/commands/ForceCloseCommand.qml \
    src/commands/ForceEditCommand.json \
    src/commands/ForceEditCommand.qml \
    src/commands/ForceQuitCommand.json \
    src/commands/ForceQuitCommand.qml \
    src/commands/HelpCommand.json \
    src/commands/HelpCommand.qml \
    src/commands/JumpCommand.json \
    src/commands/JumpCommand.qml \
    src/commands/ListCommand.json \
    src/commands/ListCommand.qml \
    src/commands/NewCommand.json \
    src/commands/NewCommand.qml \
    src/commands/NextCommand.json \
    src/commands/NextCommand.qml \
    src/commands/PreviousCommand.json \
    src/commands/PreviousCommand.qml \
    src/commands/QuitCommand.json \
    src/commands/QuitCommand.qml \
    src/commands/ReadFileCommand.json \
    src/commands/ReadFileCommand.qml \
    src/commands/ReadProcessCommand.json \
    src/commands/ReadProcessCommand.qml \
    src/commands/ReplaceCommand.json \
    src/commands/ReplaceCommand.qml \
    src/commands/SaveCloseCommand.json \
    src/commands/SaveCloseCommand.qml \
    src/commands/SaveCommand.json \
    src/commands/SaveCommand.qml \
    src/commands/SettingsCommand.json \
    src/commands/SettingsCommand.qml

commands.path = /opt/qmledit/commands

highlighters.files = \
    src/highlighters/CppSyntaxHighlighter.json \
    src/highlighters/CppSyntaxHighlighter.qml \
    src/highlighters/CSyntaxHighlighter.json \
    src/highlighters/CSyntaxHighlighter.qml \
    src/highlighters/DiffSyntaxHighlighter.json \
    src/highlighters/DiffSyntaxHighlighter.qml \
    src/highlighters/JavaScriptSyntaxHighlighter.json \
    src/highlighters/JavaScriptSyntaxHighlighter.qml \
    src/highlighters/PythonSyntaxHighlighter.json \
    src/highlighters/PythonSyntaxHighlighter.qml \
    src/highlighters/QmlSyntaxHighlighter.json \
    src/highlighters/QmlSyntaxHighlighter.qml \
    src/highlighters/ShSyntaxHighlighter.json \
    src/highlighters/ShSyntaxHighlighter.qml

highlighters.path = /opt/qmledit/highlighters

themes.files = \
    src/themes/CobaltTheme.json \
    src/themes/CobaltTheme.qml \
    src/themes/DarkmacsTheme.json \
    src/themes/DarkmacsTheme.qml \
    src/themes/DarkmateTheme.json \
    src/themes/DarkmateTheme.qml \
    src/themes/IronmanTheme.json \
    src/themes/IronmanTheme.qml \
    src/themes/KateTheme.json \
    src/themes/KateTheme.qml \
    src/themes/NeonTheme.json \
    src/themes/NeonTheme.qml \
    src/themes/OblivionTheme.json \
    src/themes/OblivionTheme.qml \
    src/themes/SolarizedDarkTheme.json \
    src/themes/SolarizedDarkTheme.qml \
    src/themes/SolarizedLightTheme.json \
    src/themes/SolarizedLightTheme.qml \
    src/themes/TangoTheme.json \
    src/themes/TangoTheme.qml \
    src/themes/Theme.json \
    src/themes/Theme.qml \
    src/themes/WombatTheme.json \
    src/themes/WombatTheme.qml

themes.path = /opt/qmledit/themes

desktop.files = desktop/qmledit.desktop
desktop.path = /usr/share/applications/hildon

icon48.files = desktop/48/qmledit.png
icon48.path = /usr/share/icons/hicolor/48x48/apps

icon64.files = desktop/64/qmledit.png
icon64.path = /usr/share/icons/hicolor/64x64/apps

launcher.files = src/qmledit
launcher.path = /usr/bin

INSTALLS += \
    app \
    commands \
    highlighters \
    themes \
    desktop \
    icon48 \
    icon64 \
    launcher

