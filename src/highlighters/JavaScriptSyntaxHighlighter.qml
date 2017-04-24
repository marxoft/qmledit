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
        startRegExp: /\/\//
        endRegExp: /$/
    }

    SyntaxHighlightRule {
        format: currentTheme.commentFormat
        startRegExp: /\/\*/
        endRegExp: /\*\//
    }

    // Strings
    SyntaxHighlightRule {
        format: currentTheme.stringFormat
        startRegExp: /"/
        endRegExp: /[^\\]("|$)/
    }

    SyntaxHighlightRule {
        format: currentTheme.stringFormat
        startRegExp: /'/
        endRegExp: /[^\\]('|$)/
    }

    // Special constants
    SyntaxHighlightRule {
        format: currentTheme.specialConstantFormat
        regExp: /\b(null|undefined)\b/
    }

    // Boolean
    SyntaxHighlightRule {
        format: currentTheme.booleanFormat
        regExp: /\b(false|true)\b/
    }

    // Numbers
    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b\d+\b/
    }
    
    // Special characters
    SyntaxHighlightRule {
        format: currentTheme.specialCharFormat
        regExp: /[{}\[\]]/
    }

    // Errors
    SyntaxHighlightRule {
        format: currentTheme.errorFormat
        regExp: /\b(implements|interface|package|private|protected|public)\b/
    }

    // Keywords
    SyntaxHighlightRule {
        format: currentTheme.keywordFormat
        regExp: /\b(async|await|break|case|catch|class|const|continue|debugger|default|delete|do|else|export|extends|finally|for|function|if|import|instanceof|in|let|new|of|return|static|super|switch|this|throw|try|typeof|var|void|while|with|yield)\b/
    }

    // Statements
    SyntaxHighlightRule {
        format: currentTheme.statementFormat
        regExp: /\.(constructor|global|ignoreCase|lastIndex|length|message|multiline|name|NEGATIVE_INFINITY|POSITIVE_INFINITY|prototype|source)\b/
        regExpIndex: 1
    }

    // Types
    SyntaxHighlightRule {
        format: currentTheme.typeFormat
        regExp: /\b(Array|Boolean|Date|Error|EvalError|Function|Infinity|Math|NaN|Number|Object|RangeError|RegExp|String|SyntaxError|TypeError|URIError)\b/
    }

    // Builtin functions
    SyntaxHighlightRule {
        format: currentTheme.builtinFormat
        regExp: /\b(abs|acos|apply|asin|atan|atan2|call|ceil|charAt|charCodeAt|concat|cos|decodeURIComponent|decodeURI|encodeURIComponent|encodeURI|escape|eval|exec|exp|floor|fromCharCode|getDate|getDay|getFullYear|getHours|getMilliseconds|getMinutes|getMonth|getSeconds|getTime|getTimezoneOffset|getUTCDate|getUTCDay|getUTCFullYear|getUTCHours|getUTCMilliseconds|getUTCMinutes|getUTCMonth|getUTCSeconds|getYear|hasOwnProperty|indexOf|isFinite|isNan|isPrototypeOf|join|lastIndexOf|localeCompare|log|match|max|min|parseFloat|parseInt|parse|pop|pow|propertyIsEnumerable|push|random|replace|reverse|round|search|setDate|setFullYear|setHours|setMilliseconds|setMinutes|setMonth|setSeconds|setTime|setUTCDate|setUTCfullYear|setUTCHours|setUTCMilliseconds|setUTCMinutes|setUTCMonth|setUTCSeconds|setYear|shift|sin|slice|sort|split|sqrt|substring|substr|tan|toDateString|toExponential|toFixed|toGMTString|toLocaleDateString|toLocaleLowerCase|toLocaleString|toLocaleTimeString|toLocaleUpperCase|toLowerCase|toPrecision|toString|toTimeString|toUpperCase|toUTCString|unescape|unshift|UTC|valueOf)\b/
    }
}

