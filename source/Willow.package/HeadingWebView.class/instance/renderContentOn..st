rendering
renderContentOn: aCanvas

	| heading |

	heading := aCanvas heading.
	commandToComponent applyTo: heading on: aCanvas.
	heading
		level: level;
		with: text