tests-Single Selection-API
testAllowsAnySatisfying

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.

	self deny: (singleSelectionView allowsAnySatisfying: [ :element | true ]).

	singleSelectionView allowAnyOf: #(1 2 3 4).

	self
		assert: (singleSelectionView allowsAnySatisfying: [ :element | element even ]);
		deny: (singleSelectionView allowsAnySatisfying: [ :element | element isZero ])