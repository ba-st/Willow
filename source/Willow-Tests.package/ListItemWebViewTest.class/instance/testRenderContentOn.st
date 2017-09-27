tests-rendering
testRenderContentOn

	| html |

	html := self
		renderUsing: [ :canvas | 
			| list |

			list := canvas unorderedList.
			list with: [ canvas render: (ListItemWebView itemizing: 'Item' containedIn: list applying: [ :listItem |  ]) ] ].

	self assert: html equals: '<ul><li>Item</li></ul>'