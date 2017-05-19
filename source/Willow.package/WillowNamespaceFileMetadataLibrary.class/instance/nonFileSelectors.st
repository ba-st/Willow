Accessing
nonFileSelectors

	^OrderedCollection new
		addAll: super nonFileSelectors;
		add: #globalWillowNamespaceDeclaration;
		add: #setUpWillowGlobalNamespace;
		add: #willowNamespace;
		yourself