instance creation
forNewBrowsingContextNavigatingTo: aLocation

	^ self navigatingTo: aLocation targetingAccordingTo: (Optional containing: '_blank')