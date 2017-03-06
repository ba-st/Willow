tests-rendering
testOnTrigger

	| radioGroup html |

	radioGroup := RadioGroupWebView applyingToEachRadioButton: CompositeComponentCommand empty.
	radioGroup allowAnyOf: #('Buenos Aires' 'CABA').
	radioGroup onTrigger disable.
	html := self render: radioGroup.

	self
		assert: html
		equals:
			'<input name="1" id="input-id2" value="1" type="radio"/>Buenos Aires<input name="1" id="input-id3" value="2" type="radio"/>CABA<script type="text/javascript">$("#input-id2").change(function(){$(this).prop("disabled",true)});$("#input-id3").change(function(){$(this).prop("disabled",true)});</script>'