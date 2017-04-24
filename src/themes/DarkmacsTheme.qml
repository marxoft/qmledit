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

Theme {
    textFormat.color: "#fff"
    textFormat.backgroundColor: "#000"
    currentLineFormat.backgroundColor: "#333"
    lineNumbersFormat.color: "#b3b3b3"
    lineNumbersFormat.backgroundColor: "#232323"
    bracketMatchFormat.backgroundColor: "#4f94cd"
    bracketMismatchFormat.backgroundColor: "#8722c9"
    bracketMismatchFormat.fontWeight: Font.Bold
    searchMatchFormat.color: "#8b2323"
    searchMatchFormat.backgroundColor: "#ee799f"
    commentFormat.color: "#8722c9"
    constantFormat.color: "#398ee6"
    stringFormat.color: "#00b200"
    stringFormat.fontWeight: Font.Bold
    specialCharFormat.color: "#cd00cd"
    specialConstantFormat.color: "#cd00cd"
    specialConstantFormat.fontWeight: Font.Bold
    booleanFormat.color: "#cd00cd"
    booleanFormat.fontWeight: Font.Bold
    keywordFormat.color: "#e67321"
    keywordFormat.fontWeight: Font.Bold
    builtinFormat.color: "#87cefa"
    variableFormat.color: "#cd00cd"
    identifierFormat.color: "#cd00cd"
    statementFormat.color: "#87cefa"
    typeFormat.color: "#398ee6"
    errorFormat.backgroundColor: "#ff0000"
    errorFormat.fontWeight: Font.Bold
    preprocessorFormat.color: "#8722c9"
    preprocessorFormat.fontWeight: Font.Bold
}

