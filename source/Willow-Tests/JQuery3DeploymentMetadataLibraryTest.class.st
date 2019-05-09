Class {
	#name : #JQuery3DeploymentMetadataLibraryTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Libraries'
}

{ #category : #tests }
JQuery3DeploymentMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: JQuery3DeploymentMetadataLibrary default
		createsAsFolders: #('jQuery-3.3.1')
		andFileContentsMatching:
			{('jQuery-3.3.1/jquery-3.3.1.min.js' -> '0aa5299be816e714a9141f4c0cf72e99690bbc82').
			('jQuery-3.3.1/jquery-3.3.1.min.map' -> '937130c6bd332333d7b2e6e63bbf90b4f4ec09c3')}
]

{ #category : #tests }
JQuery3DeploymentMetadataLibraryTest >> testHandlesFolder [

	self
		assert: (JQuery3DeploymentMetadataLibrary handlesFolder: JQuery3DeploymentMetadataLibrary folderName);
		deny: (JQuery3DeploymentMetadataLibrary handlesFolder: #files)
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
			'<html><head><title></title><script type="text/javascript" src="/files/jQuery-3.3.1/jquery-3.3.1.min.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
