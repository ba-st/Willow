Accessing
jswillowJsContent

	^ '/*!
* willow.js v<1s>
* Copyright 2018 - Buenos Aires Smalltalk
* Licensed under the MIT license
*/

"use strict";
<2s>'
		expandMacrosWith: self version
		with:
			(self
				javascriptContentFrom: [ :script |
					script << self globalWillowNamespaceDeclaration.
					script << self setUpWillowGlobalNamespace ])
