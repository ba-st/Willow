configuring
identifier

	^ identifierHolder withContentDo: [ :anId | anId ] ifUnused: [ '' ]