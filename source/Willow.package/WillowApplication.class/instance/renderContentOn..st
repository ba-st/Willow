rendering
renderContentOn: aCanvas

	aCanvas render: self contentView.
	self renderDialogAndNotificationSectionsOn: aCanvas