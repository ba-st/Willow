private
updatedIdentifierUsing: aNumber

	^ identifierHolder
		withContentDo: [ :anId | anId ]
		ifUnused: [ | id |

			id := IdentifierAssigner new identifierPrefixedBy: 'drop-down-list' using: aNumber.
			identifierHolder := Holder containing: id.
			id ]