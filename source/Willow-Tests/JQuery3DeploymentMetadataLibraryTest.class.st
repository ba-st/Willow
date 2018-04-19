Class {
	#name : #JQuery3DeploymentMetadataLibraryTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-Libraries'
}

{ #category : #tests }
JQuery3DeploymentMetadataLibraryTest >> testDeployFiles [

	self
		useFileTestingPlatformDuring: [ JQuery3DeploymentMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('jQuery-3.3.1');
				assert: GRPlatform current createdFiles equals: #('jQuery-3.3.1/jquery-3.3.1.min.js' 'jQuery-3.3.1/jquery-3.3.1.min.map') ]
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
