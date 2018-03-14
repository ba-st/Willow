tests-Multiple Selection-API
testChooseAllMatching

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(2 4 3 1).
	listBox chooseAllMatching: [ :element | element even ].

	self assert: listBox currentSelection equals: #(2 4)