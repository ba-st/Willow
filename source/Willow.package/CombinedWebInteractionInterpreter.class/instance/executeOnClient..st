configuring
executeOnClient: aServerIndependentAction

	self interpretersDo: [:interpreter | interpreter executeOnClient: aServerIndependentAction]