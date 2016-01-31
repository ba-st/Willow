processing - private
handle: anException whenLookingFor: aFilename relatedTo: aSelector declaredAs: mimeType

	Transcript
		cr;
		show: 'Couldn''t find ';
		show: aFilename.
	anException return: WAFileLibraryResource emptyInstance