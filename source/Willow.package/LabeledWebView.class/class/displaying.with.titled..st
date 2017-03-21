instance creation
displaying: aWebView with: aName titled: aTitle

	self
		deprecated: 'Use displaying:boundTo:applying: '
		transformWith: '̀@receiver displaying: ̀@aWebView with: ̀@aName titled: ̀@aTitle' -> '̀@receiver displaying: ̀@aName boundTo: ̀@aWebView  applying: (ComponentTitleCommand toSet:  ̀@aTitle )'.
	^ self displaying: aName boundTo: aWebView applying: (ComponentTitleCommand toSet: aTitle)