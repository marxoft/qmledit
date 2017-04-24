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
        id: commentRule

        format: currentTheme.commentFormat
        startRegExp: /#/
        endRegExp: /$/
    }

    // Strings
    SyntaxHighlightRule {
        id: doubleQuoteStringRule

        format: currentTheme.stringFormat
        startRegExp: /"/
        endRegExp: /[^\\]("|$)/
        allow: [shortVariableRule, variableRule]
    }

    SyntaxHighlightRule {
        id: singleQuoteStringRule

        format: currentTheme.stringFormat
        startRegExp: /'/
        endRegExp: /[^\\]('|$)/
        allow: [shortVariableRule, variableRule]
    }

    // Short parameter expansion
    SyntaxHighlightRule {
        id: shortVariableRule

        format: currentTheme.typeFormat
        regExp: /\$([!@?*#\$0-9]|[a-zA-Z0-9_]+)/
    }

    // Parameter expansion
    SyntaxHighlightRule {
        id: variableRule

        format: currentTheme.typeFormat
        startRegExp: /\$\{/
        endRegExp: /\}/
    }

    // Backtick subshell
    SyntaxHighlightRule {
        id: backtickRule

        format: currentTheme.preprocessorFormat
        startRegExp: /`/
        endRegExp: /`/
    }

    // Subshell
    SyntaxHighlightRule {
        id: subshellRule

        format: currentTheme.preprocessorFormat
        startRegExp: /\(/
        endRegExp: /\)/
    }

    // Punctuators
    SyntaxHighlightRule {
        id: punctuatorRule

        format: currentTheme.keywordFormat
        regExp: /[;\|&\/]/
    }

    // Functions
    SyntaxHighlightRule {
        id: functionRule

        format: currentTheme.functionFormat
        regExp: /\b[a-z-A-Z_][a-z-A-Z0-9_]+[ \t]*\(\)/
    }

    // Redirection
    SyntaxHighlightRule {
        id: redirectionRule

        format: currentTheme.keywordFormat
        regExp: /\b(>&+[0-9]|[0-9]+>&|[0-9]+>&+[0-9]|[0-9]+>|>>|[0-9]+>>|<&[0-9]|[0-9]+<&|[0-9]+<&[0-9]|[0-9]+<|<<+[0-9]|[0-9]+<<)\b/
    }

    // Operators
    SyntaxHighlightRule {
        id: operatorRule

        format: currentTheme.operatorFormat
        regExp:/\b(\-a|\-b|\-c|\-d|\-e|\-f|\-g|\-h|\-k|\-p|\-r|\-s|\-t|\-u|\-w|\-x|\-O|\-G|\-L|\-S|\-N|\-nt|\-ot|\-ef|\-o|\-z|\-n|<|>|\!=|\-eq|\-ne|\-lt|\-le|\-gt|\-ge)\b/
    }

    SyntaxHighlightRule {
        id: variableDeclarationRule

        format: currentTheme.variableFormat
        regExp: /([a-zA-Z0-9_]+)\=/
        regExpIndex: 1
    }

    // Builtin commands
    SyntaxHighlightRule {
        id: builtinCommandRule

        format: currentTheme.keywordFormat
        regExp: /\b(\!|\{|\}|\:|\.)\b/
    }

    // Keywords
    SyntaxHighlightRule {
        id: keywordRule

        format: currentTheme.keywordFormat
        regExp: /\b(case|esac|do|done|elif|else|fi|for|function|if|in|select|then|until|while|alias|bg|bind|break|builtin|cd|command|compgen|complete|continue|declare|dirs|disown|echo|enable|eval|exec|exit|export|fc|fg|getopts|hash|help|history|jobs|let|local|logout|popd|printf|pushd|read|readonly|return|set|shift|shopt|source|suspend|test|times|trap|type|typeset|ulimit|umask|unalias|unset|wait)\b/
    }

    // Common commands
    SyntaxHighlightRule {
        id: commonCommandRule

        format: currentTheme.keywordFormat
        regExp: /\b(ar|awk|basename|bash|beep|bunzip2|bzcat|bzcmp|bzdiff|bzegrep|bzfgrep|bzgrep|bzip2recover|bzip2|bzless|bzmore|cc|cat|chattr|chgrp|chmod|chown|chroot|clear|cmp|cpp|cp|cut|date|dd|df|dialog|diff3|diff|dirname|dir|du|egrep|eject|env|expr|false|fgrep|file|find|fmt|free|ftp|funzip|fuser|gawk|gcc|getent|getopt|grep|groups|gunzip|gzip|head|hostname|id|ifconfig|info|insmod|install|join|killall|kill|lastb|last|ld|less|ln|locate|lockfile|login|logname|lp|lpr|lsattr|ls|lsmod|make|man|mkdir|mkfifo|mknod|mktemp|modprobe|more|mount|mv|namei|nawk|nice|nl|passwd|patch|perl|pgawk|pidof|ping|pkg-config|pr|ps|pwd|readlink|renice|rmdir|rm|scp|sed|seq|sh|sleep|sort|split|ssh-add|ssh-agent|ssh-keygen|ssh-keyscan|ssh|stat|sudo|sum|su|sync|tac|tail|tar|tee|tempfile|touch|true|tr|umount|uname|uniq|unlink|unzip|uptime|wall|wc|wget|whereis|which|whoami|who|write|w|xargs|xdialog|zcat|zcmp|zdiff|zegrep|zenity|zfgrep|zforce|zgrep|zip|zless|zmore|znew)\b/
    }
}

