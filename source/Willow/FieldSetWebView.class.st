"
A Web View that renders a fieldSet with custom styles.
"
Class {
	#name : #FieldSetWebView,
	#superclass : #WAPainter,
	#instVars : [
		'title',
		'contentView',
		'fieldSetCommand',
		'legendCommand'
	],
	#category : #'Willow-WebViews'
}

{ #category : #'instance creation' }
FieldSetWebView class >> containing: aWebView applying: fieldSetCommand withLegend: aTitle applying: legendCommand [

	^ self new
		initializeContaining: aWebView
		applying: fieldSetCommand asWebComponentCommand
		withLegend: aTitle
		applying: legendCommand asWebComponentCommand
]

{ #category : #initialization }
FieldSetWebView >> initializeContaining: aWebView applying: aFieldSetCommand withLegend: aTitle applying: aLegendCommand [

	title := aTitle.
	contentView := aWebView.
	fieldSetCommand := aFieldSetCommand.
	legendCommand := aLegendCommand
]

{ #category : #rendering }
FieldSetWebView >> renderContentOn: aCanvas [

	| fieldSet |

	fieldSet := aCanvas fieldSet.
	fieldSetCommand applyTo: fieldSet on: aCanvas.
	fieldSet
		with: [ | legend |

			legend := aCanvas legend.
			legendCommand applyTo: legend on: aCanvas.
			legend with: title.
			aCanvas render: contentView ]
]
