accessing
filter: aWALibraryCollection

	^ aWALibraryCollection select: [ :library | library subclasses isEmpty and: [ library isForDevelopment ] ]