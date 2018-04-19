Class {
	#name : #JQuery3DevelopmentMetadataLibraryTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-Libraries'
}

{ #category : #tests }
JQuery3DevelopmentMetadataLibraryTest >> testDeployFiles [

	self
		useFileTestingPlatformDuring: [ JQuery3DevelopmentMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('jQuery-3.3.1');
				assert: GRPlatform current createdFiles equals: #('jQuery-3.3.1/jquery-3.3.1.js') ]
]

{ #category : #tests }
JQuery3DevelopmentMetadataLibraryTest >> testHandlesFolder [

	self
		assert: (JQuery3DevelopmentMetadataLibrary handlesFolder: JQuery3DevelopmentMetadataLibrary folderName);
		deny: (JQuery3DevelopmentMetadataLibrary handlesFolder: #files)
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
			'<html><head><title></title><script type="text/javascript" src="/files/jQuery-3.3.1/jquery-3.3.1.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
