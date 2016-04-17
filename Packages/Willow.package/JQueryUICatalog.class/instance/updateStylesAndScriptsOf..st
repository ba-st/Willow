processing
updateStylesAndScriptsOf: aRoot

	aRoot javascript url: self filesLocation / 'jquery.js'.
	aRoot javascript url: self filesLocation / 'jquery-ui.js'.
	aRoot stylesheet url: self filesLocation / 'jquery-ui.css'