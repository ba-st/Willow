*Willow-JQueryUI-Tests
configureDialogWith: interpreter
	^ self apply: interpreter toComponentDefinedBy: [ :canvas | canvas jQuery new dialog ] afterApplyingDo: [ :canvas :dialog | canvas div script: dialog ]