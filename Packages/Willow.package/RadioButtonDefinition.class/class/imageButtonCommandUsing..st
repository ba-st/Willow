accessing - private
imageButtonCommandUsing: anIconStyleNameProvider

	^
	[:radioComponent :element :theCanvas |
	radioComponent script: ((theCanvas jQuery this button)
				text: false;
				primaryIcon: (anIconStyleNameProvider value: element))]