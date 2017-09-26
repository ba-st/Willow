tests
testClassificationCommands

	| html |

	html := self apply: self commandBuilder addClass loading toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-loading"></div>'.
	
	html := self apply: self commandBuilder addClass willow toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow"></div>'.
	
	html := self apply: self commandBuilder addClass dialogContainer toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-dialog-container"></div>'.
	
	html := self apply: self commandBuilder addClass disabledComponent toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-disabled-component"></div>'.
	
	html := self apply: self commandBuilder addClass fadingNotification toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-fading-notification"></div>'