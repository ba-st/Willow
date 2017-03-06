tests-rendering
testRenderContentOnWithCommands

	| radioGroup html |

	radioGroup := RadioGroupWebView applyingToEachRadioButton: (ComponentClassificationCommand toStyleWith: WillowCssStyles radio).
	radioGroup allowAnyOf: #($a $b).
	html := self render: radioGroup.

	self assert: html equals: '<input name="1" class="radio" value="1" type="radio"/>a<input name="1" class="radio" value="2" type="radio"/>b'