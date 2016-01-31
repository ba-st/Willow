instance creation
describedBy: aDescription representedBy: anIcon

	^ self describedBy: aDescription applying: (Array with: (self iconButtonCommandFor: anIcon))