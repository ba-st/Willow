Class {
	#name : #FieldSetWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-WebViews'
}

{ #category : #tests }
FieldSetWebViewTest >> testRenderContentOn [

	| container html |

	container := FieldSetWebView
		containing: [ :canvas | canvas div ]
		applying: [ :fieldSet | fieldSet addClass willow ]
		withLegend: 'Fields'
		applying: [ :legend | legend addClass loading ].

	html := self render: container.

	self assert: html equals: '<fieldset class="willow"><legend class="willow-loading">Fields</legend><div></div></fieldset>'
]
