tests-processing
testApplyToOn
|html|
html := self apply: DisableComponentCommand new toComponentDefinedBy: [ :canvas | canvas div ].
self assert: html equals: '<div disabled="disabled"></div>'