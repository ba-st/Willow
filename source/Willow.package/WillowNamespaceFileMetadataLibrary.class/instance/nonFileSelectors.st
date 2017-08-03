Accessing
nonFileSelectors

	^ OrderedCollection new
		addAll: super nonFileSelectors;
		addAll: #(globalWillowNamespaceDeclaration setUpWillowGlobalNamespace willowNamespace defaultHandleAjaxErrorCallFunction sessionInformation willowDefaults callServerFunction);
		yourself