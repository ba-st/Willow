tests
testCssConstants

	[ :command :constants | 
	self
		assert: constants css inherit equals: CssConstants inherit;
		assert: constants cssFonts allPetiteCaps equals: CssFontConstants allPetiteCaps;
		assert: constants cssMediaQuery landscape equals: CssMediaQueryConstants landscape ] asWebComponentCommand