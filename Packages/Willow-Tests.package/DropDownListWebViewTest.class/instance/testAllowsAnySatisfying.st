tests-Single Selection-API
testAllowsAnySatisfying

	| dropDownList |

	dropDownList := DropDownListWebView applying: CompositeComponentCommand empty.

	self deny: (dropDownList allowsAnySatisfying: [ :element | true ]).

	dropDownList allowAnyOf: #(1 2 3 4).

	self
		assert: (dropDownList allowsAnySatisfying: [ :element | element even ]);
		deny: (dropDownList allowsAnySatisfying: [ :element | element isZero ])