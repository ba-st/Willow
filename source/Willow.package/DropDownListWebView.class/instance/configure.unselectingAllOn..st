private
configure: select unselectingAllOn: aCanvas

	^ availableElements ifNotEmpty: [ select script: (aCanvas jQuery this propertyAt: 'selectedIndex' put: -1) ]