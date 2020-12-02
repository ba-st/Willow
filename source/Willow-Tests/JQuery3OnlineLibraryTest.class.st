"
A JQuery3OnlineLibraryTest is a test class for testing the behavior of JQuery3OnlineLibrary
"
Class {
	#name : #JQuery3OnlineLibraryTest,
	#superclass : #TestCase,
	#category : #'Willow-Tests-Libraries'
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
			'<html><head><title></title><script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
