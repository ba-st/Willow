accessing
language

	^ WALocale fromString: (self session preferenceAt: WillowSystemConfiguration languageKey ifAbsent: [ 'en' ])