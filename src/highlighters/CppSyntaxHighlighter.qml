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

CSyntaxHighlighter {
    // Keywords
    SyntaxHighlightRule {
        format: currentTheme.keywordFormat
        regExp: /\b(and|and_eq|bitand|bitor|catch|class|compl|constexpr|decltype|delete|dynamic_cast|false|final|friend|namespace|new|noexcept|not|not_eq|nullptr|operator|or|or_eq|override|private|protected|public|reinterpret_cast|static_assert|static_cast|this|throw|true|try|typeid|typename|using|virtual|xor|xor_eq)\b/
    }

    // Types
    SyntaxHighlightRule {
        format: currentTheme.typeFormat
        regExp: /\b(explicit|export|mutable|nullptr_t)\b/
    }

    // Common defines
    SyntaxHighlightRule {
        format: currentTheme.cCommonDefinesFormat
        regExp: /\b(__STDC__|__cplusplus)\b/
    }
}

