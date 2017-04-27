Accessing
jswillowJsContent

	^ '/*!
* willow.js v<1s> 
* Copyright 2017 - Buenos Aires Smalltalk
* Licensed under the MIT license
*/
 
"use strict";
var Willow;

if (Willow === undefined) {
    Willow = {
        version: "<1s>",
        <2s>: function (xmlHttpRequest, textStatus, errorThrown) {
        }
    };
};
' expandMacrosWith: self version with: WillowConstants handleAjaxErrorCallFunctionName