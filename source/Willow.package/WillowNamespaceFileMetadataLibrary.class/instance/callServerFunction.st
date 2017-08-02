private
callServerFunction

	| function |

	function := JSFunction new arguments: (Array with: self sessionInformation asJavascript).
	function << (self sessionInformation property: 'dataType') assign: 'script'.
	function << (self sessionInformation property: 'error')
		assign: WillowJavascriptNamespace new handleAjaxErrorCallFunction.
	function << function jQuery call: 'ajax' with: self sessionInformation.
	^ function