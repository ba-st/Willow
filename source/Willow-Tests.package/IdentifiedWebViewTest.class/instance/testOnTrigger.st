tests-rendering
testOnTrigger

	| identifiedView html |

	identifiedView := IdentifiedWebView forDivNamed: 'main' containing: (PhrasingContainerWebView wrapping: 'Text' applying: [ :container |  ]).
	identifiedView onTrigger disable.
	html := self render: identifiedView.

	self assert: html equals: '<div id="main-id1"><span id="span-id2">Text</span></div><script type="text/javascript">$("#span-id2").click(function(event){$(this).prop("disabled",true)});</script>'