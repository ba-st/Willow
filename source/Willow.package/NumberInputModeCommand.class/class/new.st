instance creation
new

	self deprecated: 'Use InputModeCommand' transformWith: 'NumberInputModeCommand new' -> 'InputModeCommand asNumber'.
	^ InputModeCommand asNumber