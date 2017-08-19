rendering - private
renderOptionalLabelRelatedTo: checkbox on: aCanvas

	labelOptional
		withContentDo: [ :label | 
			| id |

			id := self identifyIn: aCanvas.
			checkbox id: id.
			aCanvas label
				for: id;
				with: label ]
		ifUnused: [ identifierAssigner withAssignedIdentifierDo: [ :id | checkbox id: id ] ]