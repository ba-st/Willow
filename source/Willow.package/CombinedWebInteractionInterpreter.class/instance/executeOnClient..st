Configuring
executeOnClient: aServerIndependentAction

	self interpretersDo: [:interpreter | interpreter executeOnClient: aServerIndependentAction]