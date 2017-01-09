accessing
notificationSectionName
	self
		deprecated: 'Please use WillowConstants notificationSectionName instead'
		transformWith: 'WebViewSections notificationSectionName' -> 'WillowConstants notificationSectionName'.
	^ WillowConstants notificationSectionName