accessing - private
textButtonCommandFor: aDescription

	^ [ :aComponent :aCanvas | aComponent script: (aCanvas jQuery this button text: aDescription) ]