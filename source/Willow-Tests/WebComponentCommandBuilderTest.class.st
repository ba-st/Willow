"
A WebComponentCommandBuilderTest is a test class for testing the behavior of WebComponentCommandBuilder
"
Class {
	#name : #WebComponentCommandBuilderTest,
	#superclass : #WARenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #private }
WebComponentCommandBuilderTest >> commandBuilder [

	^ WebComponentCommandBuilder new
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testARIARoleCommand [

	| html |

	html := self apply: (self commandBuilder setARIARoleTo: #presentation) toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div role="presentation"></div>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testAccessibilityEnrichmentCommands [

	| html |

	html := self apply: (self commandBuilder setARIAAttribute: 'describedBy' to: 'helpBlock') toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input aria-describedBy="helpBlock" type="text"/>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testAttributeCommands [

	| html |

	html := self apply: (self commandBuilder setAttribute: 'rows' to: 5) toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div rows="5"></div>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testAutofocusCommand [

	| html |

	html := self
		apply: self commandBuilder beAutofocused
		toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div autofocus></div>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testBlockExtension [

	| html |

	html := self
		apply: [ :command | (command addScript js: [ :canvas | canvas jQuery this clone ]) + command bePasswordInput ] asWebComponentCommand
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input id="id1" type="password"/><script type="text/javascript">$("#id1").clone();</script>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testBoundaryCommands [

	| html |

	html := self apply: self commandBuilder boundNotNegative toComponentDefinedBy: [ :canvas | canvas numberInput ].

	self assert: html equals: '<input min="0" type="number"/>'.

	html := self
		apply: (self commandBuilder boundBetween: 15 and: 20)
		toComponentDefinedBy: [ :canvas | canvas numberInput ].

	self assert: html equals: '<input min="15" max="20" type="number"/>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testCallbackSettingCommand [

	| html |

	html := self
		apply: (self commandBuilder setCallbackTo: [ "Do something in real life." ])
		toComponentDefinedBy: [ :canvas | canvas anchor ].

	self assert: html equals: '<a href="/?1"></a>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testClassificationCommands [

	| html |

	html := self apply: self commandBuilder addClass loading toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-loading"></div>'.
	
	html := self apply: self commandBuilder addClass willow toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow"></div>'.
	
	html := self apply: self commandBuilder addClass dialogContainer toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-dialog-container"></div>'.
	
	html := self apply: self commandBuilder addClass disabledComponent toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-disabled-component"></div>'.
	
	html := self apply: self commandBuilder addClass fadingNotification toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="willow-fading-notification"></div>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testCompositeCommand [

	| html |

	html := self
		apply: [ :field | (field addScript js: [ :canvas | canvas jQuery this clone ]) + field bePasswordInput ] asWebComponentCommand
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input id="id1" type="password"/><script type="text/javascript">$("#id1").clone();</script>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testConditionalCommand [

	| html |

	html := self
		apply: [ :field | field when: [ true ] apply: field beReadOnly ] asWebComponentCommand
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input readonly type="text"/>'.

	html := self
		apply: [ :field | field when: [ false ] apply: field beReadOnly ] asWebComponentCommand
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input type="text"/>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testDeselectAllOptionsCommands [

	| html |

	html := self apply: self commandBuilder deselectAllOptions toComponentDefinedBy: [ :canvas | canvas select ].

	self
		assert: html
		equals: '<select id="id1"></select><script type="text/javascript">$("#id1").prop("selectedIndex",-1);</script>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testDisableCommand [

	| html |

	html := self apply: self commandBuilder beDisabled toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div disabled></div>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testDisableTabCycleCommand [

	| html |

	html := self apply: self commandBuilder disableTabCycle toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div tabindex="-1"></div>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testInputModeCommands [

	| html |

	html := self apply: self commandBuilder beDateInput toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas dateInput5 ]).

	html := self apply: self commandBuilder beNumberInput toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas numberInput ]).

	html := self apply: self commandBuilder bePasswordInput toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input type="password"/>'.

	html := self apply: self commandBuilder beEmailInput toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input type="email"/>'.

	html := self apply: self commandBuilder beTextInput toComponentDefinedBy: [ :canvas | canvas textInput type: 'date' ].

	self assert: html equals: '<input type="text"/>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testListLabelingCommand [

	| html |

	html := self
		apply: (self commandBuilder labelItemsWith: [ :string | string asUppercase ])
		toComponentDefinedBy: [ :canvas | canvas select list: #('one' 'two') ].

	self assert: html equals: '<select><option>ONE</option><option>TWO</option></select>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testMaxLengthCommand [

	| html |

	html := self apply: (self commandBuilder setMaximumLengthTo: 25) toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input maxlength="25" type="text"/>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testMetadataCommands [

	| html |

	html := self apply: (self commandBuilder setData: 'content' to: 15) toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div data-content="15"></div>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testNamingCommand [

	| html |

	html := self apply: (self commandBuilder setNameTo: 'name') toComponentDefinedBy: [ :canvas | canvas anchor ].

	self assert: html equals: '<a name="name"></a>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testPlaceholderCommands [

	| html |

	html := self apply: (self commandBuilder setPlaceholderTo: 'user') toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input placeholder="user" type="text"/>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testReadOnlyCommand [

	| html |

	html := self apply: self commandBuilder beReadOnly toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input readonly type="text"/>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testRequiredCommand [

	| html |

	html := self apply: self commandBuilder beRequired toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input required type="text"/>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testScriptCommands [

	| html |

	html := self
		apply: (self commandBuilder addScript js: [ :canvas | canvas jQuery this clone ])
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input id="id1" type="text"/><script type="text/javascript">$("#id1").clone();</script>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testSetComponentStyleCommands [

	| html |

	html := self apply: (self commandBuilder setStyleTo: [ :style :constants | style background: constants >> #colors >> #blue ]) toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div style="background: blue;"></div>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testTabIndexCommand [

	| html |

	html := self apply: (self commandBuilder setTabIndexTo: 3) toComponentDefinedBy: [ :canvas | canvas select ].

	self assert: html equals: '<select tabindex="3"></select>'
]

{ #category : #tests }
WebComponentCommandBuilderTest >> testTitleCommand [

	| html |

	html := self apply: (self commandBuilder setTitleTo: 'image') toComponentDefinedBy: [ :canvas | canvas image ].

	self assert: html equals: '<img alt="" title="image"/>'
]
