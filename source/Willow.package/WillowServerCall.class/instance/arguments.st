accessing
arguments

	self options
		removeKey: 'dataType' ifAbsent: [  ];
		removeKey: 'error' ifAbsent: [  ].
	^ super arguments