tests-Single Selection-API
testChooseAny

	| singleSelectionView allowedElements |

	singleSelectionView := self newSingleSelectionView.

	singleSelectionView chooseAny.

	self should: [ singleSelectionView currentSelection ] raise: SelectionIsInvalid.

	allowedElements := #(1 2 3 4).

	singleSelectionView
		allowAnyOf: allowedElements;
		chooseAny.

	self assert: (allowedElements includes: singleSelectionView currentSelection)