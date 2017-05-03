tests-rendering
testRenderContentOnWithCommands

	| html |

	html := self
		renderUsing: [ :canvas | 
			| list |

			list := canvas unorderedList.
			list
				with: [ canvas render: (ListItemWebView itemizing: 'Item' containedIn: list applying: (ComponentClassificationCommand toStyleWith: 'item')) ] ].

	self assert: html equals: '<ul><li class="item">Item</li></ul>'