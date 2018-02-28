tests-Supplying
testRadioRenderingWithApplying

	self
		assertRenderingOf:
			[ :supplier | supplier radioRenderingWith: #asUppercase applyingToLabel: [ :radio | radio addClass willow ] applyingToInput: [ :radio | radio addClass willow ] ]
		equals: ''.

	self
		assertRenderingOf: [ :supplier | 
			(supplier radioRenderingWith: #asUppercase applyingToLabel: [ :radio | radio addClass willow ] applyingToInput: [ :radio | radio addClass willow ])
				allowAnyOf: #(f h);
				yourself ]
		equals:
			'<label for="radio-button-id2" class="willow"><input name="1" id="radio-button-id2" class="willow" value="1" type="radio"/>F</label><label for="radio-button-id3" class="willow"><input name="1" id="radio-button-id3" class="willow" value="2" type="radio"/>H</label>'