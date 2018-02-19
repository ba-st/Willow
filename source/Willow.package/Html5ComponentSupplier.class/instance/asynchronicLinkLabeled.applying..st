Supplying
asynchronicLinkLabeled: aRenderable applying: aComponentCommand

	| linkView |

	linkView := LinkWebView labeled: aRenderable applying: aComponentCommand.
	linkView onTrigger
		executeOnClient: [ :script :canvas | script << canvas jQuery event preventDefault ].
	^ linkView