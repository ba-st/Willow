tests-rendering
testForFormNamedContaining

	| identifiedView html |

	identifiedView := IdentifiedWebView forFormNamed: 'main' containing: [ :canvas | canvas div: 'Hi' ].
	html := self render: identifiedView.
	self assert: html equals:  '<form accept-charset="utf-8" method="post" action="/" onsubmit="return false;" id="main-id1"><div>Hi</div></form>'