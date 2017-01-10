signalling
signalToExecute: aCommandCollection asHandlingOf: aSignal
	self new
		tag: (aCommandCollection collect: [ :command | command connectedTo: aSignal ]);
		signal: aSignal messageText