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

SyntaxHighlighter {
    // Comments
    SyntaxHighlightRule {
        format: currentTheme.commentFormat
        regExp: /#/
        endRegExp: /$/
    }

    // String formatting
    SyntaxHighlightRule {
        format: currentTheme.characterFormat
        regExp: /%\([_a-zA-Z][_a-zA-Z0-9]*\)[#0\- \+]*(\-?[1-9][0-9]*|\*)?(\.(\-?[1-9][0-9]*|\*))?(hlL)?[diouxXeEfFgGcrs%]/
    }

    // Escaped character
    SyntaxHighlightRule {
        format: currentTheme.specialCharFormat
        regExp: /\\([\\'"abfnrtv]|N\{[A-Z\ ]+\}|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8}|x[0-9A-Fa-f]{1,2}|[0-7]{1,3})/
    }

    // Multiline strings
    SyntaxHighlightRule {
        format: currentTheme.stringFormat
        startRegExp: /(u|U|r|ur|R|UR|Ur|uR)?'''/
        endRegExp: /'''/
    }

    SyntaxHighlightRule {
        format: currentTheme.stringFormat
        startRegExp: /(u|U|r|ur|R|UR|Ur|uR)?"""/
        endRegExp: /"""/
    }

    // Strings
    SyntaxHighlightRule {
        format: currentTheme.stringFormat
        startRegExp: /(u|U|r|ur|R|UR|Ur|uR)?'/
        endRegExp: /[^\\]('|$)/
    }

    SyntaxHighlightRule {
        format: currentTheme.stringFormat
        startRegExp: /(u|U|r|ur|R|UR|Ur|uR)?"/
        endRegExp: /[^\\]("|$)/
    }

    // Special variables
    SyntaxHighlightRule {
        format: currentTheme.identifierFormat
        regExp: /\b(self|__name__|__debug__)\b/
    }

    // Boolean
    SyntaxHighlightRule {
        format: currentTheme.booleanFormat
        regExp: /\b(True|False)\b/
    }

    // Float
    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b((\d+)?\.\d+|\d+\.)|((\d+|(\d+)?\.\d+|\d+\.)[eE][+-]?\d+)\b/
    }

    // Complex number
    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b(((\d+)?\.\d+|\d+\.)|((\d+|(\d+)?\.\d+|\d+\.)[eE][+-]?\d+)|\d+)[jJ]\b/
    }

    // Decimal
    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b([1-9][0-9]*|0)[lL]?\b/
    }

    // Octal
    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b0[0-7]+[lL]?\b/
    }

    // Hex
    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b0[xX][0-9A-Fa-f]+[lL]?\b/
    }

    // Module handler
    SyntaxHighlightRule {
        format: currentTheme.preprocessorFormat
        regExp: /\b(import|from|as)\b/
    }

    SyntaxHighlightRule {
        format: currentTheme.functionFormat
        regExp: /\bfrom\s+(\.*[_a-zA-Z][_a-zA-Z0-9]*\.*[_a-zA-Z][_a-zA-Z0-9]*|\.+)/
        regExpIndex: 1
    }

    // Decoarator
    SyntaxHighlightRule {
        format: currentTheme.preprocessorFormat
        regExp: /@\.*[_a-zA-Z][_a-zA-Z0-9]*\.*[_a-zA-Z][_a-zA-Z0-9]*|\.+/
    }

    // Keywords
    SyntaxHighlightRule {
        format: currentTheme.keywordFormat
        regExp: /\b(and|assert|break|class|continue|def|del|elif|else|except|exec|finally|for|global|if|in|is|lambda|not|or|pass|print|raise|return|try|while|with|yield)\b/
    }

    // Constants
    SyntaxHighlightRule {
        format: currentTheme.specialConstantFormat
        regExp: /\b(Ellipsis|None|NotImplemented)\b/
    }

    // Objects
    SyntaxHighlightRule {
        format: currentTheme.typeFormat
        regExp: /\b(ArithmeticError|AssertionError|EnvironmentError|EOFError|Exception|FloatingPointError|ImportError|IndentationError|IndexError|IOError|KeyboardInterrupt|KeyError|LookupError|MemoryError|NameError|NotImplementedError|OSError|OverflowError|ReferenceError|RuntimeError|StandardError|StopIteration|SyntaxError|SystemError|SystemExit|TabError|TypeError|UnboundLocalError|UnicodeDecodeError|UnicodeEncodeError|UnicodeTranslateError|ValueError|WindowsError|ZeroDivisionError|Warning|UserWarning|DeprecationWarning|PendingDeprecationWarning|SyntaxWarning|OverflowWarning|RuntimeWarning|FutureWarning)\b/
    }

    // Functions
    SyntaxHighlightRule {
        format: currentTheme.builtinFormat
        regExp: /\b(__import__|abs|all|any|apply|basestring|bin|bool|buffer|callable|chr|classmethod|cmp|coerce|compile|complex|delattr|dict|dir|divmod|enumerate|eval|execfile|file|filter|float|format|frozenset|getattr|globals|hasattr|hash|hex|id|input|int|intern|isinstance|issubclass|iter|len|list|locals|long|map|max|min|object|oct|open|ord|pow|property|range|raw_input|reduce|reload|repr|reversed|round|setattr|set|slice|sorted|staticmethod|str|sum|super|tuple|type|unichr|unicode|vars|xrange|zip)\b/
    }
}
