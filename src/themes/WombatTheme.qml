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

Theme {
    textFormat.color: "#f6f3e8"
    textFormat.backgroundColor: "#242424"
    currentLineFormat.backgroundColor: "#2d2d2d"
    bracketMatchFormat.backgroundColor: "#857b6f"
    bracketMatchFormat.fontWeight: Font.Bold
    cursorFormat.backgroundColor: "#656565"
    lineNumbersFormat.color: "#857b6f"
    lineNumbersFormat.backgroundColor: "#000"
    commentFormat.color: "#99968b"
    commentFormat.fontItalic: true
    constantFormat.color: "#e5786d"
    stringFormat.color: "#953454"
    stringFormat.fontItalic: true
    identifierFormat.color: "#cae682"
    functionFormat.color: "#cae682"
    typeFormat.color: "#cae682"
    statementFormat.color: "#8ac6f2"
    keywordFormat.color: "#8ac6f2"
    numberFormat.color: "#e5786d"
    preprocessorFormat.color: "#e5786d"
}

