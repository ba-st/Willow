configuring
chooseFirst

	| contents |
	contents := self obtainContents.
	contents isEmpty ifFalse: [self choose: contents first]