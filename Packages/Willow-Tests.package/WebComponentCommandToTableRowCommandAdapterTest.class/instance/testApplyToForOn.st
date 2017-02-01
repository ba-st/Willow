tests-Applying
testApplyToForOn

	| html command |

	command := (ComponentClassificationCommand toStyleWith: WillowCssStyles fadingNotification) asTableRowCommand.
	html := self
		renderUsing: [ :canvas | 
			| component |

			component := canvas tableRow.
			command applyTo: component for: 33 on: canvas ].

	self
		assert: html
		equals:
			(String
				streamContents: [ :stream | 
					stream
						nextPutAll: '<tr class="';
						nextPutAll: WillowCssStyles fadingNotification;
						nextPutAll: '"></tr>' ])