tests
testClassificationCommands

	| html |

	html := self apply: self commandBuilder css loading toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-loading"></div>'.
	
	html := self apply: self commandBuilder css willow toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow"></div>'.
	
	html := self apply: self commandBuilder css dialogContainer toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-dialog-container"></div>'.
	
	html := self apply: self commandBuilder css disabledComponent toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-disabled-component"></div>'.
	
	html := self apply: self commandBuilder css fadingNotification toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-fading-notification"></div>'