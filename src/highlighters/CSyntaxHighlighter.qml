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
        allow: printfRule
    }

    // Printf
    SyntaxHighlightRule {
        id: printfRule

        format: currentTheme.specialCharFormat
        regExp: /\%\%|\%(?:[1-9][0-9]*\$)?[#0\- \+'I]*(?:[1-9][0-9]*|\*)?(?:\.\-?(?:[0-9]+|\*))?(?:hh|ll|[hlLqjzt])?[diouxXeEfFgGaAcsCSpnm]/
    }

    // Ifdefs
    SyntaxHighlightRule {
        format: currentTheme.commentFormat
        startRegExp: /^\s*#\s*if\b\s*0\b/
        endRegExp: /^\s*#\s*(endif|else|elif)\b/
    }

    SyntaxHighlightRule {
        format: currentTheme.preprocessorFormat
        startRegExp: /^\s*#\s*(define|undef|error|pragma|ident|if(n?def)?|else|elif|endif|line|warning)\b/
        endRegExp: /$/
    }

    // Includes
    SyntaxHighlightRule {
        format: currentTheme.preprocessorFormat
        regExp: /^\s*#\s*(include|import)\b/
    }

    SyntaxHighlightRule {
        format: currentTheme.stringFormat
        regExp: /^\s*#\s*(include|import)\s*(".*?"|<.*>)/
        regExpIndex: 2
    }

    // Characters
    SyntaxHighlightRule {
        format: currentTheme.characterFormat
        regExp: /'(\\'|[^'])'/
    }

    // Numbers
    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b((\.[0-9]+|[0-9]+\.[0-9]*)([Ee][+-]?[0-9]*)?|([0-9]+[Ee][+-]?[0-9]*))[fFlL]?\b/
    }

    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b0[xX][a-fA-F0-9]+[uUlL]*\b/
    }

    SyntaxHighlightRule {
        format: currentTheme.errorFormat
        regExp: /\b0[xX][a-fA-F0-9]*[g-zG-Z][a-zA-Z0-9]*[uUlL]*\b/
    }

    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b0[0-7]+[uUlL]*\b/
    }

    SyntaxHighlightRule {
        format: currentTheme.errorFormat
        regExp: /\b0[0-7]*[89][0-9]*[uUlL]*\b/
    }

    SyntaxHighlightRule {
        format: currentTheme.numberFormat
        regExp: /\b(0|[1-9][0-9]*)[uUlL]*\b/
    }

    // Keywords
    SyntaxHighlightRule {
        format: currentTheme.keywordFormat
        regExp: /\b(asm|break|case|continue|default|do|else|enum|for|fortran|goto|if|return|struct|switch|typedef|union|while)\b/
    }

    // Operators
    SyntaxHighlightRule {
        format: currentTheme.operatorFormat
        regExp: /\b((_A|a)lignof|_Generic|offsetof|(_S|s)tatic_assert|sizeof|typeof)\b/
    }

    // Types
    SyntaxHighlightRule {
        format: currentTheme.typeFormat
        regExp: /\b(_Bool|_Complex|_Imaginary|bool|char|char(16|32)_t|double|float|int|(u)?int(_least|_fast)?(8|16|32|64)_t|(u)?intmax_t|(u)?intptr_t|long|ptrdiff_t|off(64)?_t|short|signed|size_t|ssize_t|unsigned|void|wchar_t|wint_t)\b/
    }

    // Storage class
    SyntaxHighlightRule {
        format: currentTheme.typeFormat
        regExp: /\b((_A|a)lignas|_Atomic|(_N|n)oreturn|(_T|t)hread_local|auto|const|extern|inline|register|restrict|static|volatile)\b/
    }

    // Boolean
    SyntaxHighlightRule {
        format: currentTheme.booleanFormat
        regExp: /\b(false|true)\b/
    }

    // Constants
    SyntaxHighlightRule {
        format: currentTheme.constantFormat
        regExp: /\b(stdin|stdout|stderr)\b/
    }

    // Signals
    SyntaxHighlightRule {
        format: currentTheme.constantFormat
        regExp: /\b(SIGABRT|SIGALRM|SIGCHLD|SIGCONT|SIGFPE|SIGHUP|SIGILL|SIGINT|SIGKILL|SIGPIPE|SIGQUIT|SIGSEGV|SIGSTOP|SIGTERM|SIGTRAP|SIGTSTP|SIGTTIN|SIGTTOU|SIGUSR1|SIGUSR2)\b/
    }

    // Special constants
    SyntaxHighlightRule {
        format: currentTheme.specialConstantFormat
        regExp: /\b(NULL|MAX|MIN|TRUE|FALSE|__LINE__|__DATA__|__FILE__|__func__|__TIME__|__STDC__)\b/
    }
}

