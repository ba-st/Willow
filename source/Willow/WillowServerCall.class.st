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

	| currentOptions |

	"Workaround for a bug in Grease - See github.com/SeasideSt/Grease#81
	Original code:
	self options
		removeKey: 'dataType' ifAbsent: [  ];
		removeKey: 'error' ifAbsent: [  ]."
	currentOptions := self options.
	options := GRSmallDictionary2 new.
	currentOptions
		keysDo: [ :key | 
			( #('dataType' 'error') includes: key )
				ifFalse: [ options at: key put: ( currentOptions at: key ) ]
			].
	^ super arguments
]

{ #category : #accessing }
WillowServerCall >> method [

	^ self constants >> #willow >> #callServerFunctionName
]
