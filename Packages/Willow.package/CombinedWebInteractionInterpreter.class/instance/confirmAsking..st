configuring
confirmAsking: aQuestion

	self interpretersDo: [:interpreter | interpreter confirmAsking: aQuestion] 