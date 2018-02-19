instance creation
asynchronicLabeled: aRenderable applying: aComponentCommand

	| linkView |

	linkView := self labeled: aRenderable applying: aComponentCommand.
	linkView onTrigger
		executeOnClient: [ :script :canvas | script << canvas jQuery event preventDefault ].
	^ linkView