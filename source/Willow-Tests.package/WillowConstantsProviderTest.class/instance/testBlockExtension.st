tests
testBlockExtension

	| html |

	html := self
		apply:
			[ :command :constants | command script js: [ :canvas | canvas jQuery this onClick: (canvas jQuery id: constants willow dialogSectionName) clone ] ]
				asWebComponentCommand
		toComponentDefinedBy: [ :canvas | canvas anchor ].

	self
		assert: html
		equals: '<a id="id1"></a><script type="text/javascript">$("#id1").click(function(){$("#willow-dialog-section").clone()});</script>'