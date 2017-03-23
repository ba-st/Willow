initialization
initializeOnModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff

	iterator := CircularIterator
		cyclingOver:
			{anObjectToUseWhenOn.
			anObjectToUseWhenOff}.
	interested := Set new