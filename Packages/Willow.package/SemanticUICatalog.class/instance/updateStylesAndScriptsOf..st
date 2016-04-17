processing
updateStylesAndScriptsOf: aRoot

	aRoot javascript url: self filesLocation / 'jquery.js'.
	aRoot javascript url: self filesLocation / 'semantic.js'.
	aRoot stylesheet url: self filesLocation / 'semantic.css'