private
updatedIdentifierUsing: aNumber

	^ identifierHolder
		withContentDo: [ :anId | anId ]
		ifUnused: [ | id |

			id := IdentifierAssigner new identifierPrefixedBy: 'list-box' using: aNumber.
			identifierHolder := Holder containing: id.
			id ]