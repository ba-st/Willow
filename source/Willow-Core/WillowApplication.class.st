"
I'm a basic Willow application providing some guidance to the developers.
"
Class {
	#name : #WillowApplication,
	#superclass : #WAComponent,
	#pools : [
		'Willow'
	],
	#category : #'Willow-Core-Applications'
}

{ #category : #accessing }
WillowApplication class >> applicationTitle [
	
	^self subclassResponsibility 
]

{ #category : #configuring }
WillowApplication class >> configureErrorHandlerInDeployedModeTo: aWAApplication [

	aWAApplication filter configuration at: #exceptionHandler put: self errorHandlerFactory
]

{ #category : #accessing }
WillowApplication class >> errorHandlerFactory [

	"By default we don't do anything special with the AJAX errors, but my subclasses can specify some specific handling."

	^ AjaxAwareErrorHandlerFactory new
]

{ #category : #accessing }
WillowApplication class >> handlerName [

	^self subclassResponsibility 
]

{ #category : #'private-utility' }
WillowApplication class >> installFileHandlerAccordingTo: theDeploymentMode [

	WADeploymentAwareFileHandler installAsFileHandlerAccordingTo: theDeploymentMode
]

{ #category : #'private-utility' }
WillowApplication class >> registerAsApplicationUsing: deploymentModeClass [

	| application |

	application := WAAdmin register: self asApplicationAt: self handlerName.
	application preferenceAt: #sessionClass put: self sessionClass.
	deploymentModeClass new configureErrorHandlerTo: application using: self.
	application configuration addParent: WillowSystemConfiguration instance.
	application preferenceAt: WillowSystemConfiguration deploymentModeClassKey put: deploymentModeClass.
	self installFileHandlerAccordingTo: deploymentModeClass new.
	^ application
]

{ #category : #utility }
WillowApplication class >> registerAsDeployedApplication [

	^ self registerAsApplicationUsing: WAApplicationDeployed
]

{ #category : #utility }
WillowApplication class >> registerAsDevelopmentApplication [

	^ self registerAsApplicationUsing: WAApplicationInDevelopment
]

{ #category : #accessing }
WillowApplication class >> sessionClass [

	^ WillowSession
]

{ #category : #utility }
WillowApplication class >> unregisterFromApplications [

	WAEnvironment registerDefaultRequestHandlers.
	^ WAAdmin unregister: self handlerName
]

{ #category : #accessing }
WillowApplication >> applicationTitle [
	
	^self class applicationTitle  
]

{ #category : #accessing }
WillowApplication >> componentSupplierForApplication [

	self subclassResponsibility
]

{ #category : #accessing }
WillowApplication >> contentView [

	^ self subclassResponsibility
]

{ #category : #accessing }
WillowApplication >> deploymentMode [

	^ (self session preferenceAt: WillowSystemConfiguration deploymentModeClassKey ifAbsent: [ WAApplicationInDevelopment ]) new
]

{ #category : #hooks }
WillowApplication >> initialRequest: aRequest [

	self session startUpApplicationContextFor: self
]

{ #category : #accessing }
WillowApplication >> jQueryLibrary [

	^ self subclassResponsibility
]

{ #category : #accessing }
WillowApplication >> language [

	^ WALocale fromString: (self session preferenceAt: WillowSystemConfiguration languageKey ifAbsent: [ 'en' ])
]

{ #category : #rendering }
WillowApplication >> renderContentOn: aCanvas [

	aCanvas render: self contentView.
	self renderDialogAndNotificationSectionsOn: aCanvas
]

{ #category : #'private - rendering' }
WillowApplication >> renderDialogAndNotificationSectionsOn: aCanvas [

	"Render dialog and notification sections. These are needed for the dialog and notification support."

	aCanvas div
		id: Constants >> #willow >> #dialogSectionName;
		apply: [ :div | div addClass dialogContainer ].
	aCanvas div id: Constants >> #willow >> #notificationSectionName
]

{ #category : #accessing }
WillowApplication >> requiredLibraries [

	"This hook provides an easy way to include additional libraries to the ones declared by the component supplier"

	^ #()
]

{ #category : #updating }
WillowApplication >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot title: self applicationTitle.
	aRoot htmlAttributes at: 'lang' put: self language greaseString.
	self jQueryLibrary updateRoot: aRoot.
	WillowNamespaceFileMetadataLibrary default updateRoot: aRoot.
	self componentSupplier updateRoot: aRoot.
	self requiredLibraries do: [ :library | library updateRoot: aRoot ]
]
