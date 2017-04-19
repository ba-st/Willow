Updating
updateRoot: aRoot

	aRoot javascript
		url: ('https://code.jquery.com/jquery-<1s>.min.js' expandMacrosWith: self version);
		attributeAt: 'integrity' put: 'sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=';
		attributeAt: 'crossorigin' put: 'anonymous'