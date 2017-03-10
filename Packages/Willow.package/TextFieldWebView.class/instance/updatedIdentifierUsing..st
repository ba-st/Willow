private
updatedIdentifierUsing: aNumber

	^ identifierHolder
		withContentDo: [ :anId | anId ]
		ifUnused: [ | id |

			id := IdentifierAssigner new identifierPrefixedBy: 'text' using: aNumber.
			identifierHolder := Holder containing: id.
			id ]