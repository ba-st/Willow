updating - private
updatedIdentifierUsing: aNumber

	^ identifierHolder
		withContentDo: [ :anId | anId ]
		ifUnused: [ | id |

			id := IdentifierAssigner new identifierPrefixedBy: name using: aNumber.
			identifierHolder := Holder containing: id.
			id ]