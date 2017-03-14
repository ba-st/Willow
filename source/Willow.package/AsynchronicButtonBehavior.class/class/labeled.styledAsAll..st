Instance Creation
labeled: aLabel styledAsAll: cssClasses

	^ self labeled: aLabel applying: (ComponentClassificationCommand toStyleWithAll: cssClasses)