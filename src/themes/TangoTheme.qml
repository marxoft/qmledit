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
    currentLineFormat.backgroundColor: "#eeeeec"
    drawSpacesFormat.color: "#babdb6"
    bracketMatchFormat.color: "#eeeeec"
    bracketMatchFormat.backgroundColor: "#babdb6"
    bracketMismatchFormat.color: "#eeeeec"
    bracketMismatchFormat.backgroundColor: "#a40000"
    rightMarginFormat.color: "#2e3436"
    rightMarginFormat.backgroundColor: "#2e3436"
    searchMatchFormat.backgroundColor: "#fce94f"
    commentFormat.color: "#204a87"
    constantFormat.color: "#ad7fa8"
    specialCharFormat.color: "#5c3566"
    identifierFormat.color: "#3465a4"
    statementFormat.color: "#a40000"
    statementFormat.fontWeight: Font.Bold
    typeFormat.color: "#4e9a06"
    typeFormat.fontWeight: Font.Bold
    preprocessorFormat.color: "#8f5902"
    errorFormat.backgroundColor: "#cc0000"
    errorFormat.fontWeight: Font.Bold
}

