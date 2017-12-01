private - processing
registerActionsOf: aCommand

	modelLoadingActions addAll: aCommand modelLoadingActions.
	clientIndependentActions addAll: aCommand clientIndependentActions.
	priorityActions addAll: aCommand priorityActions.
	serverIndependentActions addAll: aCommand serverIndependentActions.