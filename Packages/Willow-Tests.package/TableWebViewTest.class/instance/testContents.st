tests-container-API
testContents

	| table |

	table := TableWebView headlessDefinedBy: #() applying: CompositeComponentCommand empty.

	self assert: table contents isEmpty.

	table changeContentsTo: #(1 2 3).

	self assert: table contents equals: #(1 2 3)