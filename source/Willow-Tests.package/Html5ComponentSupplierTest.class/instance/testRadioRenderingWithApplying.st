tests-Supplying
testRadioRenderingWithApplying

	| supplier radio html |

	supplier := Html5ComponentSupplier new.
	radio := supplier
		radioRenderingWith: #asUppercase
		applying: (ComponentClassificationCommand toStyleWith: WillowCssStyles willow).

	html := self render: radio.
	self assert: html isEmpty.

	radio allowAnyOf: #(f h).
	html := self render: radio.
	self
		assert: html
		equals:
			'<label for="radio-button-id2" class="willow"><input name="1" id="radio-button-id2" class="willow" value="1" type="radio"/>F</label><label for="radio-button-id3" class="willow"><input name="1" id="radio-button-id3" class="willow" value="2" type="radio"/>H</label>'