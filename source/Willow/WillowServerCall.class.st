"
I represent an AJAX call in Willow
"
Class {
	#name : #WillowServerCall,
	#superclass : #JQAjax,
	#category : #'Willow-WebInteraction'
}

{ #category : #accessing }
WillowServerCall >> arguments [

	self options
		removeKey: 'dataType' ifAbsent: [  ];
		removeKey: 'error' ifAbsent: [  ].
	^ super arguments
]

{ #category : #accessing }
WillowServerCall >> method [

	^ self constants >> #willow >> #callServerFunctionName
]
