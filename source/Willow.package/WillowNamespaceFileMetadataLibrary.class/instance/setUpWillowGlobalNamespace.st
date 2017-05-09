private
setUpWillowGlobalNamespace

	^ (self willowNamespace identicalTo: JSStream undefined)
		nonInlinedThen:
			(self willowNamespace
				assign:
					(GRSmallDictionary new
						at: 'version' put: self version;
						at: WillowConstants handleAjaxErrorCallFunctionName put: (JSFunction new arguments: #(xmlHttpRequest textStatus errorThrown));
						yourself))