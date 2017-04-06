tests
testRepresentingApplying

	| icon html |

	icon := BootstrapIconWebView
		representing: Glyphicons menuUp
		applying: (ComponentMetadataCommand toDeclare: BootstrapConstants dismiss with: true).

	html := self render: icon.

	self assert: html equals: '<span class="glyphicon glyphicon-menu-up" data-dismiss="data-dismiss"></span>'