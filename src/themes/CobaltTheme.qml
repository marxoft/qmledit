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
    textFormat.backgroundColor: "#001b33"
    selectionFormat.backgroundColor: "#0088ff"
    currentLineFormat.backgroundColor: "#003b70"
    lineNumbersFormat.color: "#0065bf"
    lineNumbersFormat.backgroundColor: "#000d1a"
    drawSpacesFormat.color: "#777"
    rightMarginFormat.color: "#ccc"
    rightMarginFormat.backgroundColor: "#ccc"
    bracketMatchFormat.backgroundColor: "#4f94cd"
    bracketMismatchFormat.backgroundColor: "#990000"
    searchMatchFormat.backgroundColor: "#00bf8c"
    commentFormat.color: "#0088ff"
    commentFormat.fontItalic: true
    constantFormat.color: "#ffee80"
    stringFormat.color: "#3ad900"
    specialCharFormat.color: "#ccc"
    specialConstantFormat.color: "#ff0044"
    specialConstantFormat.fontWeight: Font.Bold
    booleanFormat.color: "#ff0044"
    numberFormat.color: "#ff0044"
    keywordFormat.color: "#ff9d00"
    keywordFormat.fontWeight: Font.Bold
    builtinFormat.color: "#ff9d00"
    builtinFormat.fontWeight: Font.Bold
    variableFormat.color: "#ccc"
    identifierFormat.color: "#ccc"
    functionFormat.color: "#ccc"
    statementFormat.color: "#ff9d00"
    typeFormat.color: "#80ffbb"
    errorFormat.backgroundColor: "#002f29"
    errorFormat.fontWeight: Font.Bold
    preprocessorFormat.color: "#ccc"
    includeFormat.color: "#3ad900"
}

