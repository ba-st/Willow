instance creation
between: aMinimum and: aMaximum

	self
		deprecated: 'Use TextFieldWebView'
		transformWith: 'NumberWebView between: ̀@aMinimum and: ̀@aMaximum' -> 'TextFieldWebView singleLineTriggeringOnChangeApplying: NumberInputModeCommand new + (ComponentBoundaryCommand between: ̀@aMinimum and: ̀@aMaximum)'.
	^ TextFieldWebView singleLineTriggeringOnChangeApplying: NumberInputModeCommand new + (ComponentBoundaryCommand between: aMinimum and: aMaximum)