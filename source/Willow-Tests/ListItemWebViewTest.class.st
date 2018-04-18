"
A ListItemWebViewTest is a test class for testing the behavior of ListItemWebView
"
Class {
	#name : #ListItemWebViewTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-WebViews'
}

{ #category : #'tests-rendering' }
ListItemWebViewTest >> testRenderContentOn [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| list |

			list := canvas unorderedList.
			list with: [ canvas render: (ListItemWebView itemizing: 'Item' containedIn: list applying: [ :listItem |  ]) ] ].

	self assert: html equals: '<ul><li>Item</li></ul>'
]

{ #category : #'tests-rendering' }
ListItemWebViewTest >> testRenderContentOnWithCommands [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| list |

			list := canvas unorderedList.
			list with: [ canvas render: (ListItemWebView itemizing: 'Item' containedIn: list applying: [ :listItem | listItem addClass willow ]) ] ].

	self assert: html equals: '<ul><li class="willow">Item</li></ul>'
]
