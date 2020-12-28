"
A MultipleSelectionListBoxWebViewTest is a test class for testing the behavior of MultipleSelectionListBoxWebView
"
Class {
	#name : #MultipleSelectionListBoxWebViewTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'notificationWasReceived'
	],
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #support }
MultipleSelectionListBoxWebViewTest >> changeNotifiedBy: aDropDownListWebView [ 
	
	notificationWasReceived := true
]

{ #category : #support }
MultipleSelectionListBoxWebViewTest >> newListBox [

	^ MultipleSelectionListBoxWebView applying: [ :listBox |  ]
]

{ #category : #'tests-Multiple Selection-API' }
MultipleSelectionListBoxWebViewTest >> testAllowsAnySatisfying [

	| listBox |

	listBox := self newListBox.

	self deny: (listBox allowsAnySatisfying: [ :element | true ]).

	listBox allowAnyOf: #(1 2 3 4).

	self
		assert: (listBox allowsAnySatisfying: [ :element | element even ]);
		deny: (listBox allowsAnySatisfying: [ :element | element isZero ])
]

{ #category : #'tests-Multiple Selection-API' }
MultipleSelectionListBoxWebViewTest >> testChooseAll [

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).

	listBox notifyChangesTo: self.
	listBox chooseAll.

	notificationWasReceived := false.

	self assert: listBox currentSelection equals: #(1).

	listBox allowAnyOf: #(2 4 3 1).

	self assert: notificationWasReceived.

	listBox chooseAll.

	self
		assert: notificationWasReceived;
		assert: listBox currentSelection equals: #(2 4 3 1)
]

{ #category : #'tests-Multiple Selection-API' }
MultipleSelectionListBoxWebViewTest >> testChooseAllIn [

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).

	listBox notifyChangesTo: self.
	listBox chooseAllIn: #(1).

	notificationWasReceived := false.

	self assert: listBox currentSelection equals: #(1).

	listBox allowAnyOf: #(2 4 3 1).

	self assert: notificationWasReceived.
	self assert: listBox currentSelection equals: #(1)
]

{ #category : #'tests-Multiple Selection-API' }
MultipleSelectionListBoxWebViewTest >> testChooseAllInWhenNotAvailable [

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).

	listBox notifyChangesTo: self.
	listBox chooseAllIn: #(1).

	notificationWasReceived := false.

	self assert: listBox currentSelection equals: #(1).

	listBox allowAnyOf: #(2 4).

	self assert: notificationWasReceived.
	self assert: listBox currentSelection isEmpty
]

{ #category : #'tests-Multiple Selection-API' }
MultipleSelectionListBoxWebViewTest >> testChooseAllMatching [

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(2 4 3 1).
	listBox chooseAllMatching: [ :element | element even ].

	self assert: listBox currentSelection equals: #(2 4)
]

{ #category : #tests }
MultipleSelectionListBoxWebViewTest >> testIdentifyIn [

	| listBox html |

	listBox := self newListBox.

	html := self
		renderUsing: [ :canvas | 
			listBox identifyIn: canvas.
			canvas render: listBox
			].

	self
		assert: html
			equals: '<select name="2" id="list-box-id1" multiple></select><input name="3" type="hidden"/>';
		assert: listBox identifier equals: 'list-box-id1'
]

{ #category : #'tests-Multiple Selection-API' }
MultipleSelectionListBoxWebViewTest >> testNotifyChangesTo [

	| singleSelectionView |

	singleSelectionView := self newListBox.
	singleSelectionView notifyChangesTo: self.

	notificationWasReceived := false.
	singleSelectionView disallowAll.

	self assert: notificationWasReceived
]

{ #category : #'tests-Multiple Selection-API' }
MultipleSelectionListBoxWebViewTest >> testNotifyChangesWhenSelectionChanged [

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).

	listBox notifyChangesTo: self.

	notificationWasReceived := false.
	listBox chooseAllIn: #(1).

	self assert: listBox currentSelection equals: #(1).
	self assert: notificationWasReceived
]

{ #category : #'tests-Multiple Selection-API' }
MultipleSelectionListBoxWebViewTest >> testNotifyChangesWhenSelectionDoesNotChange [

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).
	listBox notifyChangesTo: self.

	notificationWasReceived := false.

	listBox chooseAllIn: #().

	self
		assert: notificationWasReceived;
		assert: listBox currentSelection isEmpty
]

{ #category : #'tests-rendering' }
MultipleSelectionListBoxWebViewTest >> testOnTrigger [

	| listBox html |

	listBox := self newListBox.
	listBox on trigger disable.

	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" id="select-id2" multiple></select><input name="3" type="hidden"/><script type="text/javascript">$("#select-id2").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
MultipleSelectionListBoxWebViewTest >> testRenderContentOn [

	| listBox html |

	listBox := self newListBox.

	html := self render: listBox.

	self assert: html equals: '<select name="1" multiple></select><input name="2" type="hidden"/>'
]

{ #category : #'tests-rendering' }
MultipleSelectionListBoxWebViewTest >> testRenderContentOnWithCommands [

	| listBox html |

	listBox := MultipleSelectionListBoxWebView applying: [ :command | command addClass willow ].
	html := self render: listBox.

	self assert: html equals: '<select name="1" class="willow" multiple></select><input name="2" type="hidden"/>'
]

{ #category : #'tests-rendering' }
MultipleSelectionListBoxWebViewTest >> testRenderContentOnWithElements [

	| listBox html |

	listBox := self newListBox.
	listBox allowAnyOf: #('One' 'Two' 'Three').
	html := self render: listBox.

	self assert: html equals: '<select name="1" multiple><option value="1">One</option><option value="2">Two</option><option value="3">Three</option></select><input name="2" type="hidden"/>'
]

{ #category : #'tests-rendering' }
MultipleSelectionListBoxWebViewTest >> testRenderContentOnWithElementsAndSomethingSelected [

	| listBox html |

	listBox := self newListBox.
	listBox allowAnyOf: #('One' 'Two' 'Three').
	listBox chooseAllIn: #('Two' 'Three').
	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" multiple><option value="1">One</option><option value="2" selected>Two</option><option value="3" selected>Three</option></select><input name="2" type="hidden"/>'
]
