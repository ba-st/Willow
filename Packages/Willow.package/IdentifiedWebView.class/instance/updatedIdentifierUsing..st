private
updatedIdentifierUsing: aNumber

	^ identifierHolder
		withContentDo: [ :anId | anId ]
		ifUnused: [ | id |

			id := IdentifierAssigner new identifierPrefixedBy: identificationPrefix using: aNumber.
			identifierHolder := Holder containing: id.
			id ]