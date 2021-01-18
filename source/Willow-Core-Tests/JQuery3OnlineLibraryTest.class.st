"
A JQuery3OnlineLibraryTest is a test class for testing the behavior of JQuery3OnlineLibrary
"
Class {
	#name : #JQuery3OnlineLibraryTest,
	#superclass : #TestCase,
	#category : #'Willow-Core-Tests-Libraries'
}

{ #category : #'tests-updating' }
JQuery3OnlineLibraryTest >> testUpdateRoot [

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQuery3OnlineLibrary default updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<html><head><title></title><script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-ZvpUoO/+PpLXR1lu4jmpXWu80pZlYUAfxl5NsBMWOEPSjUn/6Z/hRTt8+pR6L4N2" crossorigin="anonymous"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
