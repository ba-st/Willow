tests
testFormDoNotSubmit

	| html |

	html := self
		render: [ :canvas | 
			| form |

			form := canvas form.
			form doNotSubmit ].

	self assert: html equals: '<form accept-charset="UTF-8" method="post" action="/" onsubmit="return false;"></form>'