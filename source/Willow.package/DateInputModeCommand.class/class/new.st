instance creation
new

	self deprecated: 'Use InputModeCommand' transformWith: 'DateInputModeCommand new' -> 'InputModeCommand asDate'.
	^ InputModeCommand asDate