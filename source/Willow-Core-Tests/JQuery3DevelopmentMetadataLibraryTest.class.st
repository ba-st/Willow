Class {
	#name : #JQuery3DevelopmentMetadataLibraryTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Libraries'
}

{ #category : #tests }
JQuery3DevelopmentMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: JQuery3DevelopmentMetadataLibrary default
		createsAsFolders: #('jQuery-3.5.1')
		andFileContentsMatching: {( 'jQuery-3.5.1/jquery-3.5.1.js' -> 'ad16c4a132ad2a03b4951185fed46d55397b5e88' )}
]

{ #category : #tests }
JQuery3DevelopmentMetadataLibraryTest >> testHandlesFolder [

	self
		assert: ( JQuery3DevelopmentMetadataLibrary handlesFolder: JQuery3DevelopmentMetadataLibrary folderName );
		deny: ( JQuery3DevelopmentMetadataLibrary handlesFolder: #files )
]

{ #category : #tests }
JQuery3DevelopmentMetadataLibraryTest >> testIsForDevelopment [

	self
		assert: JQuery3DevelopmentMetadataLibrary isForDevelopment;
		deny: JQuery3DevelopmentMetadataLibrary isForDeployment
]

{ #category : #tests }
JQuery3DevelopmentMetadataLibraryTest >> testUpdateRoot [

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQuery3DevelopmentMetadataLibrary default updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<html><head><title></title><script type="text/javascript" src="/files/jQuery-3.5.1/jquery-3.5.1.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
