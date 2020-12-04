Class {
	#name : #JQuery3DeploymentMetadataLibraryTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Libraries'
}

{ #category : #tests }
JQuery3DeploymentMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: JQuery3DeploymentMetadataLibrary default
		createsAsFolders: #('jQuery-3.5.1')
		andFileContentsMatching:
			{( 'jQuery-3.5.1/jquery-3.5.1.min.js' -> 'c8e1c8b386dc5b7a9184c763c88d19a346eb3342' ).
			( 'jQuery-3.5.1/jquery-3.5.1.min.map' -> '6207ad2639a863210f202384044a575c69a678ac' )}
]

{ #category : #tests }
JQuery3DeploymentMetadataLibraryTest >> testHandlesFolder [

	self
		assert: ( JQuery3DeploymentMetadataLibrary handlesFolder: JQuery3DeploymentMetadataLibrary folderName );
		deny: ( JQuery3DeploymentMetadataLibrary handlesFolder: #files )
]

{ #category : #tests }
JQuery3DeploymentMetadataLibraryTest >> testIsForDeployment [

	self
		assert: JQuery3DeploymentMetadataLibrary isForDeployment;
		deny: JQuery3DeploymentMetadataLibrary isForDevelopment
]

{ #category : #tests }
JQuery3DeploymentMetadataLibraryTest >> testUpdateRoot [

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQuery3DeploymentMetadataLibrary default updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<html><head><title></title><script type="text/javascript" src="/files/jQuery-3.5.1/jquery-3.5.1.min.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
