tests-accessing
setUp

	super setUp.
	command := FormSubmitCommand findingComponentUsing: [ :canvas | canvas jQuery this ]