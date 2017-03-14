tests-Single Selection-API
testChooseEqualTo

	| singleSelectionView allowedElements |

	singleSelectionView := self newSingleSelectionView.

	singleSelectionView chooseEqualTo: 3.

	self should: [ singleSelectionView currentSelection ] raise: SelectionIsInvalid.

	allowedElements := #(1 2 3 4).

	singleSelectionView
		allowAnyOf: allowedElements;
		chooseEqualTo: 2.

	self assert: singleSelectionView currentSelection equals: 2.

	singleSelectionView chooseEqualTo: 4.

	self assert: singleSelectionView currentSelection equals: 4