tests-Single Selection-API
testWithCurrentSelectionDo

	| singleSelectionView allowedElements |

	singleSelectionView := self newSingleSelectionView.

	singleSelectionView withCurrentSelectionDo: [ :selectedElement | self fail ].

	allowedElements := #(1 2 3 4).
	singleSelectionView
		allowAnyOf: allowedElements;
		chooseAny.

	singleSelectionView withCurrentSelectionDo: [ :selectedElement | self assert: (allowedElements includes: selectedElement) ]