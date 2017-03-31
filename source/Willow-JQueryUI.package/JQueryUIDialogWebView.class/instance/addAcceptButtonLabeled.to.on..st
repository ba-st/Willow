configuring - private
addAcceptButtonLabeled: aString to: aDialog on: aCanvas

	| functions |

	self configureAcceptButton.

	functions := Set new.
	interactionInterpreter applyTo: functions on: aCanvas.
	aDialog addButton: aString do: functions any