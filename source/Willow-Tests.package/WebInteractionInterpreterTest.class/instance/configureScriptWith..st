test support
configureScriptWith: interpreter
	^ self apply: interpreter toComponentDefinedBy: [ :canvas | canvas javascript ] afterApplyingDo: [ :canvas :javascript | canvas div script: javascript ]