tests-Multiple Selection-API
testAllowsAnySatisfying

	| listBox |

	listBox := self newListBox.

	self deny: (listBox allowsAnySatisfying: [ :element | true ]).

	listBox allowAnyOf: #(1 2 3 4).

	self
		assert: (listBox allowsAnySatisfying: [ :element | element even ]);
		deny: (listBox allowsAnySatisfying: [ :element | element isZero ])