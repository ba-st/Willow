tests - Configuring - CSS
testToggleCssClassOn

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter toggleCssClass: WillowCssStyles willow on: (IdentifiedWebView forDivNamed: 'example' containing: [  ]).
	html := self configureTextInputWith: interpreter.
	self assert: html equals: '<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$("#example-id1").toggleClass("willow")});</script>'