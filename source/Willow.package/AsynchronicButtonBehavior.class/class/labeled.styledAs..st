Instance Creation
labeled: aLabel styledAs: aCssClass

	^ self labeled: aLabel applying: (ComponentClassificationCommand toStyleWith: aCssClass)