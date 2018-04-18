"
A WillowConstantsProviderTest is a test class for testing the behavior of WillowConstantsProvider
"
Class {
	#name : #WillowConstantsProviderTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-Frontend'
}

{ #category : #tests }
WillowConstantsProviderTest >> testBlockExtension [

	| html |

	html := self
		apply: [ :anchor :constants | anchor addScript js: [ :canvas | canvas jQuery this onClick: (canvas jQuery id: constants willow dialogSectionName) clone ] ] asWebComponentCommand
		toComponentDefinedBy: [ :canvas | canvas anchor ].

	self assert: html equals: '<a id="id1"></a><script type="text/javascript">$("#id1").click(function(){$("#willow-dialog-section").clone()});</script>'
]

{ #category : #tests }
WillowConstantsProviderTest >> testCssConstants [

	[ :command :constants | 
	self
		assert: constants css inherit equals: CssConstants inherit;
		assert: constants cssFonts allPetiteCaps equals: CssFontConstants allPetiteCaps;
		assert: constants cssMediaQuery landscape equals: CssMediaQueryConstants landscape ] asWebComponentCommand
]
