tests
testComponentSupplier

	self
		renderUsing: [ :canvas | 
			| webView |

			webView := PhrasingContainerWebView
				wrapping: 'The Content'
				applying: CompositeComponentCommand empty.
			self assert: webView componentSupplier equals: self ]