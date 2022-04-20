Class {
	#name : #JQuery3DeploymentMetadataLibraryTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Libraries'
}

{ #category : #tests }
JQuery3DeploymentMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: JQuery3DeploymentMetadataLibrary default
		createsAsFolders: #('jQuery-3.6.0')
		andFileContentsMatching:
			{( 'jQuery-3.6.0/jquery-3.6.0.min.js' -> 'b82d238d4e31fdf618bae8ac11a6c812c03dd0d4' ).
			( 'jQuery-3.6.0/jquery-3.6.0.min.map' -> '9ac9b4c063db17cc5a888429b86a17dc23c89994' )}
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
			'<html><head><title></title><script type="text/javascript" src="/files/jQuery-3.6.0/jquery-3.6.0.min.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
