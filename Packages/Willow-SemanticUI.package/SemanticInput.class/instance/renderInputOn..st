rendering - private
renderInputOn: aCanvas

	| input |

	input := aCanvas textInput.
	self assignIdentifierTo: input on: aCanvas.
	input
		value: self content;
		callback: [ :string | self setUninterpretedContentTo: string ].
	interactionInterpreter applyTo: input on: aCanvas