tests
testComponentSupplier

	self
		renderUsing: [ :canvas | 
			| webView |

			webView := PhrasingContainerWebView wrapping: 'The Content' applying: [ :container |  ].
			self assert: webView componentSupplier equals: self ]