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
    textFormat.color: "#fff"
    textFormat.backgroundColor: "#232323"
    selectionFormat.backgroundColor: "#555753"
    cursorFormat.color: "#fff"
    currentLineFormat.backgroundColor: "#000"
    lineNumbersFormat.color: "#555753"
    lineNumbersFormat.backgroundColor: "#bbbbbb"
    bracketMatchFormat.backgroundColor: "#bb66ff"
    bracketMatchFormat.fontWeight: Font.Bold
    bracketMismatchFormat.backgroundColor: "#ff79d9"
    bracketMismatchFormat.fontWeight: Font.Bold
    searchMatchFormat.color: "#232323"
    searchMatchFormat.backgroundColor: "#fce94f"
    keywordFormat.color: "#ff9900"
    keywordFormat.fontWeight: Font.Bold
    statementFormat.color: "#00c99b"
    functionFormat.color: "#9e91ff"
    preprocessorFormat.fontWeight: Font.Bold
    typeFormat.color: "#009cff"
    characterFormat.color: "#ff9900"
    commentFormat.color: "#bb66ff"
    numberFormat.color: "#00c99b"
    stringFormat.color: "#96ff00"
    errorFormat.backgroundColor: "#ff2f6a"
    errorFormat.fontWeight: Font.Bold
    escapeFormat.color: "#9e91ff"
    identifierFormat.color: "#00c900"
    identifierFormat.fontWeight: Font.Bold
    variableFormat.color: "#009cff"
    booleanFormat.color: "#ff44cc"
    booleanFormat.fontWeight: Font.Bold
    constantFormat.color: "#fce94f"
    specialConstantFormat.color: "#ff44cc"
    specialConstantFormat.fontWeight: Font.Bold
}

