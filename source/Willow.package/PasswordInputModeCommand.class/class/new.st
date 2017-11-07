instance creation
new

	self deprecated: 'Use InputModeCommand' transformWith: 'PasswordInputModeCommand new' -> 'InputModeCommand asPassword'.
	^ InputModeCommand asPassword