tests-evaluating
testApplyToOn

	self
		renderUsing: [ :canvas | 
			| component ajax |

			ajax := canvas jQuery ajax.
			component := canvas textInput.
			self
				should: [ NullTriggeringPolicy new apply: ajax to: component on: canvas ]
				raise: Error
				withExceptionDo: [ :error | 
					self
						assert: error messageText
						equals: 'Trying to generate interactive script for component declared as non-interactive' ] ]