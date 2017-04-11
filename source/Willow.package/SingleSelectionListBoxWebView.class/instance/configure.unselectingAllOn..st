private
configure: select unselectingAllOn: aCanvas

	^ availableElements ifNotEmpty: [ DeselectAllOptionsCommand new applyTo: select on: aCanvas ]