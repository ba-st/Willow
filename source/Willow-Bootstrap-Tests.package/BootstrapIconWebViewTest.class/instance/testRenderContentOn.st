tests
testRenderContentOn

	| icon html |

	icon := BootstrapIconWebView representing: Glyphicons menuUp.

	html := self render: icon.

	self assert: html equals: '<span class="glyphicon glyphicon-menu-up"></span>'