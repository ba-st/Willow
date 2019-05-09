"
A WillowApplicationTest is a test class for testing the behavior of WillowApplication
"
Class {
	#name : #WillowApplicationTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'applicationStarted'
	],
	#category : #'Willow-Tests-Applications'
}

{ #category : #accessing }
WillowApplicationTest >> componentSupplier [

	^ Html5ComponentSupplier new
]

{ #category : #accessing }
WillowApplicationTest >> createHandlers [

	^ Array with: self
]

{ #category : #accessing }
WillowApplicationTest >> isSession [

	^ true
]

{ #category : #accessing }
WillowApplicationTest >> preferenceAt: aSymbol ifAbsent: aBlock [

	^ aBlock value
]

{ #category : #accessing }
WillowApplicationTest >> startUpApplicationContextFor: aWillowApplication [

	applicationStarted := true
]

{ #category : #tests }
WillowApplicationTest >> testComponentSupplierForApplication [

	| supplier application |

	supplier := Html5ComponentSupplier new.
	application := (WillowTestingApplication using: supplier) componentSupplierForApplication.

	self assert: application equals: supplier
]

{ #category : #tests }
WillowApplicationTest >> testDeploymentMode [

	self
		renderUsing:
			[ :canvas | self assert: (WillowApplication new deploymentMode isA: WAApplicationInDevelopment) ]
]

{ #category : #tests }
WillowApplicationTest >> testIinitialRequest [

	applicationStarted := false.
	self
		renderUsing: [ :canvas | 
			WillowApplication new initialRequest: 'Not relevant'.
			self assert: applicationStarted ]
]

{ #category : #tests }
WillowApplicationTest >> testRegisterAsDeployedApplication [

	| handlers |

	handlers := WADispatcher default handlers.
	self deny: ( handlers includesKey: WillowTestingApplication handlerName ).
	WillowTestingApplication registerAsDeployedApplication.
	self assert: ( handlers includesKey: WillowTestingApplication handlerName ).
	WillowTestingApplication unregisterFromApplications.
	self deny: ( handlers includesKey: WillowTestingApplication handlerName )
]

{ #category : #tests }
WillowApplicationTest >> testRegisterAsDevelopmentApplication [

	| handlers |

	handlers := WADispatcher default handlers.
	self deny: ( handlers includesKey: WillowTestingApplication handlerName ).
	WillowTestingApplication registerAsDevelopmentApplication.
	self assert: ( handlers includesKey: WillowTestingApplication handlerName ).
	WillowTestingApplication unregisterFromApplications.
	self deny: ( handlers includesKey: WillowTestingApplication handlerName )
]

{ #category : #tests }
WillowApplicationTest >> testRenderContentOn [

	| html application |

	application := WillowTestingApplication new.
	html := self fullDocumentRendering: application.

	self
		assert: html
		equals:
			'<!DOCTYPE html><html lang="en"><head><title>The official testing app</title><script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script><script type="text/javascript" src="/files/willow-8.0.1/js/willow.js"></script></head><body onload="onLoad()"><span><select name="1"></select></span><div id="willow-dialog-section" class="willow-dialog-container"></div><div id="willow-notification-section"></div><script type="text/javascript">function onLoad(){};</script></body></html>'
]
