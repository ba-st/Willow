Accessing
nonFileSelectors

	^ OrderedCollection new
		addAll: super nonFileSelectors;
		addAll: #(globalWillowNamespaceDeclaration willowNamespace defaultHandleAjaxErrorCallFunction sessionInformation willowDefaults callServerFunction);
		yourself