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
import org.hildon.utils 1.0
import "definitions.js" as Definitions

Object {
    id: root

    property variant plugins: ([])

    function find(prop, value) {
        for (var i = 0; i < plugins.length; i++) {
            if (plugins[i][prop] === value) {
                return plugins[i];
            }
        }

        return null;
    }

    function create(fileName, parent, properties) {
        var suffix = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        var plugin;

        for (var i = 0; i < plugins.length; i++) {
            var globs = plugins[i].globs;

            for (var j = 0; j < globs.length; j++) {
                var glob = globs[j];

                if (glob.substring(glob.lastIndexOf(".") + 1).toLowerCase() == suffix) {
                    plugin = plugins[i];
                    break;
                }
            }
        }

        if (plugin) {
            var component = Qt.createComponent(plugin.qml);

            if (component) {
                if (properties) {
                    return component.createObject(parent, properties);
                }

                return component.createObject(parent);
            }
        }

        return null;
    }

    function load() {
        var p = [];

        for (var i = 0; i < Definitions.HIGHLIGHTER_PLUGIN_PATHS.length; i++) {
            dir.path = Definitions.HIGHLIGHTER_PLUGIN_PATHS[i];
            var files = dir.entryList();
            
            for (var j = 0; j < files.length; j++) {
                var path = dir.absoluteFilePath(files[j]);
                var qml = path.substring(0, path.lastIndexOf(".")) + ".qml";

                if (dir.fileExists(qml)) {
                    file.fileName = path;

                    if (file.open(File.ReadOnly)) {
                        try {
                            var plugin = JSON.parse(file.readAll());
                            plugin["qml"] = qml;
                            p.push(plugin);
                            console.log("SyntaxHighlighters.load(): Plugin loaded:", plugin.name);
                        }
                        catch(e) {
                            console.log("SyntaxHighlighters.load(): Error parsing plugin:", e);
                        }

                        file.close();
                    }
                    else {
                        console.log("SyntaxHighlighters.load(): Error reading file", path);
                    }
                }
                else {
                    console.log("SyntaxHighlighters.load(): No QML file found for path", path);
                }
            }
        }

        p.sort(function(a, b) { return a.name > b.name ? 1 : -1 });
        plugins = p;
        return plugins.length;
    }

    Directory {
        id: dir

        nameFilters: ["*.json"]
        sorting: Directory.Name
    }

    File {
        id: file
    }
}

