instance creation
describedBy: aDescription

	^ self toExecute: [ :canvas | canvas jQuery this button text: aDescription ]