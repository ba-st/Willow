tests-rendering
testRenderContentOn

	| image html |

	image := ImageWebView locatedAt: 'ok.png' applying: (ComponentErrorCommand toActUsing: [ :canvas | (JSStream this access: 'src') assign: 'ok.jpg' ]).
	html := self render: image.

	self assert: html equals: '<img alt="" src="ok.png" onerror="this.src=&quot;ok.jpg&quot;"/>'