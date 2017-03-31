configuring - private
addAcceptButtonTo: aDialog on: aCanvas

	acceptButtonOptional
		withContentDo:
			[ :buttonText | self addAcceptButtonLabeled: buttonText to: aDialog on: aCanvas ]