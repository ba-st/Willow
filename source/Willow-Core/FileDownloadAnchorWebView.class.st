"
I'm an anchor with a callback to download a document
"
Class {
	#name : #FileDownloadAnchorWebView,
	#superclass : #WAPainter,
	#instVars : [
		'label',
		'documentProvider',
		'commandToComponent'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
FileDownloadAnchorWebView class >> labeled: aLabel applying: aComponentCommand obtainingFileUsing: aFileProvider [

	^ self new
		initializeLabeled: aLabel
		applying: aComponentCommand asWebComponentCommand
		obtainingFileUsing: aFileProvider
]

{ #category : #initialization }
FileDownloadAnchorWebView >> initializeLabeled: aLabel applying: aComponentCommand obtainingFileUsing: aFileProvider [

	label := aLabel.
	documentProvider := aFileProvider.
	commandToComponent := aComponentCommand
]

{ #category : #rendering }
FileDownloadAnchorWebView >> renderContentOn: aCanvas [

	aCanvas anchor
		callback: [ aCanvas requestContext
				respond: [ :response | 
					| document |

					document := documentProvider value.
					response
						contentType: document contentType;
						attachmentWithFileName: document fileName;
						nextPutAll: document content ] ];
		with: label applying: commandToComponent
]
