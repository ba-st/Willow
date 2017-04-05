accessing
testXmlHttpRequest

	| context |

	context := self createHttpXmlRequestContext.
	"AssertionFailed is in the list of handled exceptions configured"
	[ self handlerClass
		renderNonAjaxErrorsWith: [ :canvas :error | self fail ];
		handleExceptionsDuring: [ AssertionFailed signal ] context: context ]
		on: WAResponseNotification
		do: [ :n | self fail ]