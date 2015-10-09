/*
 * Copyright (C) 2015 Stuart Howarth <showarth@marxoft.co.uk>
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

Dialog {
    id: root
    
    title: qsTr("Settings")
    height: column.height + platformStyle.paddingMedium
    
    Flickable {
        id: flickable
        
        anchors {
            left: parent.left
            right: button.left
            top: parent.top
            bottom: parent.bottom
        }
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        contentHeight: column.height
        
        Column {
            id: column
            
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            spacing: platformStyle.paddingMedium
            
            Label {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: platformStyle.secondaryTextColor
                text: qsTr("General")
            }
            
            CheckBox {
                id: textWrapCheckBox
                
                width: parent.width
                text: qsTr("Wrap text")
            }
            
            CheckBox {
                id: lineNumbersCheckBox
                
                width: parent.width
                text: qsTr("Show line numbers")
            }
            
            CheckBox {
                id: highlightCheckBox
                
                width: parent.width
                text: qsTr("Highlight current line")
            }
            
            CheckBox {
                id: marginCheckBox
                
                width: parent.width
                text: qsTr("Show right margin")
            }
            
            Label {
                width: parent.width
                text: qsTr("Right margin")
            }
            
            SpinBox {
                id: marginField
                
                width: parent.width
                minimum: 1
                maximum: 999
                suffix: " chars"
            }
            
            Label {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: platformStyle.secondaryTextColor
                text: qsTr("Font")
            }
            
            Label {
                width: parent.width
                text: qsTr("Font family")
            }
            
            TextField {
                id: fontFamilyField
                
                width: parent.width
            }
            
            ValueButton {
                id: fontStyleButton
                
                width: parent.width
                text: qsTr("Font style")
                pickSelector: fontStyleSelector
            }
            
            Label {
                width: parent.width
                text: qsTr("Font size")
            }
            
            SpinBox {
                id: fontSizeField
                
                width: parent.width
                minimum: 6
                maximum: 32
                suffix: " pt"
            }
            
            Label {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: platformStyle.secondaryTextColor
                text: qsTr("Theme")
            }
            
            Label {
                width: parent.width
                text: qsTr("Background color")
            }

            TextField {
                id: backgroundColorField
                
                width: parent.width
                style: TextFieldStyle {
                    paddingRight: 36 + platformStyle.paddingLarge * 2
                }
                
                Rectangle {
                    width: 36
                    height: 36
                    anchors {
                        right: parent.right
                        rightMargin: platformStyle.paddingLarge
                        verticalCenter: parent.verticalCenter
                    }
                    radius: 4
                    border {
                        width: 1
                        color: platformStyle.reversedTextColor
                    }
                    color: backgroundColorField.text.length > 3 ? backgroundColorField.text : settings.backgroundColor
                    smooth: true
                }
            }
            
            Label {
                width: parent.width
                text: qsTr("Highlight color")
            }

            TextField {
                id: highlightColorField
                
                width: parent.width
                style: TextFieldStyle {
                    paddingRight: 36 + platformStyle.paddingLarge * 2
                }
                
                Rectangle {
                    width: 36
                    height: 36
                    anchors {
                        right: parent.right
                        rightMargin: platformStyle.paddingLarge
                        verticalCenter: parent.verticalCenter
                    }
                    radius: 4
                    border {
                        width: 1
                        color: platformStyle.reversedTextColor
                    }
                    color: highlightColorField.text.length > 3 ? highlightColorField.text : settings.highlightColor
                    smooth: true
                }
            }
            
            Label {
                width: parent.width
                text: qsTr("Text color")
            }
            
            TextField {
                id: textColorField
                
                width: parent.width
                style: TextFieldStyle {
                    paddingRight: 36 + platformStyle.paddingLarge * 2
                }
                
                Rectangle {
                    width: 36
                    height: 36
                    anchors {
                        right: parent.right
                        rightMargin: platformStyle.paddingLarge
                        verticalCenter: parent.verticalCenter
                    }
                    radius: 4
                    border {
                        width: 1
                        color: platformStyle.reversedTextColor
                    }
                    color: textColorField.text.length > 3 ? textColorField.text : settings.textColor
                    smooth: true
                }
            }
        }
    }
    
    Button {
        id: button
        
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        style: DialogButtonStyle {}
        text: qsTr("Done")
        onClicked: root.accept()
    }
    
    ListPickSelector {
        id: fontStyleSelector
        
        function find(value) {
            for (var i = 0; i < model.length; i++) {
                if (model[i] == value) {
                    return i;
                }
            }
            
            return 0;
        }
        
        model: ["Normal", "Bold", "Italic"]
    }
    
    onAccepted: {
        settings.wrapText = textWrapCheckBox.checked;
        settings.showLineNumbers = lineNumbersCheckBox.checked;
        settings.highlightCurrentLine = highlightCheckBox.checked;
        settings.showRightMargin = marginCheckBox.checked;
        settings.rightMargin = marginField.value;
        settings.fontFamily = fontFamilyField.text;
        settings.fontStyle = fontStyleSelector.currentValueText;
        settings.fontSize = fontSizeField.value;
        
        if (backgroundColorField.text.length > 3) {
            settings.backgroundColor = backgroundColorField.text;
        }
        
        if (highlightColorField.text.length > 3) {
            settings.highlightColor = highlightColorField.text;
        }
        
        if (textColorField.text.length > 3) {
            settings.textColor = textColorField.text;
        }
    }
    onStatusChanged: {
        if (status == DialogStatus.Opening) {
            textWrapCheckBox.checked = settings.wrapText;
            lineNumbersCheckBox.checked = settings.showLineNumbers;
            highlightCheckBox.checked = settings.highlightCurrentLine;
            marginCheckBox.checked = settings.showRightMargin;
            marginField.value = settings.rightMargin;
            fontFamilyField.text = settings.fontFamily;
            fontStyleSelector.currentIndex = fontStyleSelector.find(settings.fontStyle);
            fontSizeField.value = settings.fontSize;
            backgroundColorField.text = settings.backgroundColor;
            highlightColorField.text = settings.highlightColor;
            textColorField.text = settings.textColor;
        }
    }
}
