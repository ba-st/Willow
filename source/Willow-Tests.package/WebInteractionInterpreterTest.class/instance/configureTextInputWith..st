test support
configureTextInputWith: interpreter
	^ self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput ]