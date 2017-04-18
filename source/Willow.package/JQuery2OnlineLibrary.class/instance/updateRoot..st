Updating
updateRoot: aRoot

	aRoot javascript
		url: ('https://code.jquery.com/jquery-<1s>.min.js' expandMacrosWith: self version);
		attributeAt: 'integrity' put: 'sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=';
		attributeAt: 'crossorigin' put: 'anonymous'