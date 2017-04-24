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

JavaScriptSyntaxHighlighter {
    // Elements
    SyntaxHighlightRule {
        format: currentTheme.typeFormat
        regExp: /\b([\w_]+)(\s+|)\{/
        regExpIndex: 1
    }

    // Properties
    SyntaxHighlightRule {
        format: currentTheme.variableFormat
        regExp: /\b([\w\._]+)(\s+|):/
        regExpIndex: 1
    }

    // Keywords
    SyntaxHighlightRule {
        format: currentTheme.keywordFormat
        regExp: /\b(alias|property)\b/
    }

    // Types
    SyntaxHighlightRule {
        format: currentTheme.typeFormat
        regExp: /\b(action|bool|color|date|double|enumeration|font|int|list|point|real|rect|size|string|time|url|variant|vector3d)\b/
    }
    
    // Qt functions
    SyntaxHighlightRule {
        format: currentTheme.builtinFormat
        regExp: /\bQt\.(atob|btoa|createComponent|createQmlObject|darker|fontFamilies|formatDate|formatDateTime|formatTime|hsla|include|isQtObject|lighter|md5|openUrlExternally|point|quit|rect|resolvedUrl|rgba|size|tint|vector3d)\b/
        regExpIndex: 1
    }
}

