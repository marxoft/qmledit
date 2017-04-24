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
    textFormat.color: "#000"
    textFormat.backgroundColor: "#fff"
    selectionFormat.color: "#fff"
    selectionFormat.backgroundColor: "#43ace8"
    currentLineFormat.backgroundColor: "#eef6ff"
    lineNumbersFormat.color: "#000"
    lineNumbersFormat.backgroundColor: "#d6d2d0"
    rightMarginFormat.color: "#000"
    rightMarginFormat.backgroundColor: "#000"
    bracketMatchFormat.color: "#fff"
    bracketMatchFormat.backgroundColor: "#000"
    bracketMismatchFormat.backgroundColor: "#ff0000"
    searchMatchFormat.backgroundColor: "#ffff00"
    commentFormat.color: "#808080"
    commentFormat.fontItalic: true
    typeFormat.color: "#0057ae"
    constantFormat.color: "#0057ae"
    numberFormat.color: "#b07e00"
    characterFormat.color: "#ff80e0"
    stringFormat.color: "#dd0000"
    specialCharFormat.color: "#ff00ff"
    builtinFormat.color: "#0057ae"
    identifierFormat.color: "#0057ae"
    functionFormat.color: "#0057ae"
    statementFormat.fontWeight: Font.Bold
    preprocessorFormat.fontWeight: Font.Bold
    errorFormat.color: "#ff0000"
    errorFormat.fontUnderline: true
    errorFormat.underlineStyle: TextCharFormat.SingleLine
    includeFormat.color: "#008000"
}

