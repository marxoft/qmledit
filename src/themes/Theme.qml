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

/*!
 * \class Theme
 * \brief The base class for QMLEdit themes.
 *
 * The Theme class is used for creating themes in QMLEdit.
 *
 * Themes are used to determine the appearance of documents, including syntax highlighting.
 *
 * To add a theme, you must provide both a JSON description file and a QML implementation file
 * with the same basename placed in /opt/qmledit/themes/, e.g:
 *
 * \code
 * MyTheme.json
 *
 * {
 *     "name": "My Theme",
 *     "description": "This is my theme."
 * }
 *
 * MyTheme.qml
 *
 * import QtQuick 1.0
 *
 * Theme {
 *     textFormat.color: "blue"
 *     textFormat.backgroundColor: "red"
 *     selectionFormat.color: "black"
 *     selectionFormat.backgroundColor: "white"
 * }
 * \endcode
 */
QtObject {
    // Global

    /*!
     * The default format used for text.
     */
    property TextCharFormat textFormat: TextCharFormat {
        color: "#000"
        backgroundColor: "#fff"
        fontFamily: settings.fontFamily
        fontPointSize: settings.fontSize
    }

    /*!
     * The format used for selected text.
     */
    property TextCharFormat selectionFormat: TextCharFormat {
        backgroundColor: platformStyle.selectionColor
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for the cursor.
     */
    property TextCharFormat cursorFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for highlighting the current line.
     */
    property TextCharFormat currentLineFormat: TextCharFormat {
        backgroundColor: platformStyle.selectionColor
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for line numbers.
     */
    property TextCharFormat lineNumbersFormat: TextCharFormat {
        backgroundColor: platformStyle.selectionColor
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for displaying the right margin.
     */
    property TextCharFormat rightMarginFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for highlighting matching brackets.
     */
    property TextCharFormat bracketMatchFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for highlighting mismatched brackets.#
     */
    property TextCharFormat bracketMismatchFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for whitespace, e.g. tabs.
     */
    property TextCharFormat drawSpacesFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for highlighting text matching a search pattern.
     */
    property TextCharFormat searchMatchFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    // Syntax highlighting

    /*!
     * The format used for comments.
     */
    property TextCharFormat commentFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for constants.
     */
    property TextCharFormat constantFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for character literals.
     */
    property TextCharFormat characterFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for string literals.
     */
    property TextCharFormat stringFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for the escape character.
     */
    property TextCharFormat escapeFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for special characters.
     */
    property TextCharFormat specialCharFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for special constants.
     */
    property TextCharFormat specialConstantFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for boolean values.
     */
    property TextCharFormat booleanFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for numbers, e.g. integers, floats.
     */
    property TextCharFormat numberFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for keywords.
     */
    property TextCharFormat keywordFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for builtin values.
     */
    property TextCharFormat builtinFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for variables.
     */
    property TextCharFormat variableFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for operators.
     */
    property TextCharFormat operatorFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for identifiers.
     */
    property TextCharFormat identifierFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for functions.
     */
    property TextCharFormat functionFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for statements.
     */
    property TextCharFormat statementFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for data types.
     */
    property TextCharFormat typeFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for highlighting errors.
     */
    property TextCharFormat errorFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for preprocessors.
     */
    property TextCharFormat preprocessorFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }

    /*!
     * The format used for includes/imports.
     */
     property TextCharFormat includeFormat: TextCharFormat {
        color: textFormat.color
        font: textFormat.font
        textOutlineColor: textFormat.textOutlineColor
        textOutlineStyle: textFormat.textOutlineStyle
        underlineColor: textFormat.underlineColor
        underlineStyle: textFormat.underlineStyle
        verticalAlignment: textFormat.verticalAlignment
    }
}

