accessing - private
iconButtonCommandFor: anIcon

	^ [ :aComponent :aCanvas | 
	aComponent
		script:
			(aCanvas jQuery this button
				text: false;
				primaryIcon: anIcon) ]