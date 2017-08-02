tests
testJavascriptCode

	self
		assert: WillowNamespaceFileMetadataLibrary default jswillowJsContent
		equals:
			'/*!
* willow.js v4.0.0 
* Copyright 2017 - Buenos Aires Smalltalk
* Licensed under the MIT license
*/
 
"use strict";
var Willow;if(Willow===undefined){Willow={"version":"4.0.0","handleAjaxErrorCall":function(xmlHttpRequest,textStatus,errorThrown){},"callServer":function(sessionInformation){sessionInformation["dataType"]="script";sessionInformation["error"]=Willow.handleAjaxErrorCall;$.ajax(sessionInformation)}}}'