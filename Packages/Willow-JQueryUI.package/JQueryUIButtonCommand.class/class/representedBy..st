instance creation
representedBy: anIcon

	^ self
		toExecute: [ :canvas | 
			canvas jQuery this button
				text: false;
				primaryIcon: anIcon ]