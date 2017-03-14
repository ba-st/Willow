accessing
identifier

	^ identifierHolder withContentDo: [ :anId | anId ] ifUnused: [ '' ]