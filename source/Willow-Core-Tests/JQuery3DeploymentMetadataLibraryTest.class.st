Class {
	#name : #JQuery3DeploymentMetadataLibraryTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Libraries'
}

{ #category : #tests }
JQuery3DeploymentMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: JQuery3DeploymentMetadataLibrary default
		createsAsFolders: #( 'jQuery-3.7.0' )
		andFileContentsMatching: {
				'jQuery-3.7.0/jquery-3.7.0.min.js' -> '5a9eeac34d86e92e5660e0f4f87204f1ed0c8ff6'.
				'jQuery-3.7.0/jquery-3.7.0.min.map' -> 'f0a09c945cbc5407aff55492303806a1f8fda6d0' }
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
			'<html><head><title></title><script type="text/javascript" src="/files/jQuery-3.7.0/jquery-3.7.0.min.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
