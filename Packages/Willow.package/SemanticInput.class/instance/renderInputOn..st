rendering - private
renderInputOn: aCanvas

	| input |

	input := aCanvas textInput.
	input
		value: self content;
		callback: [ :string | self setUninterpretedContentTo: string ].
	interactionInterpreter applyTo: input on: aCanvas