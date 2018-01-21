private - rendering
renderDialogAndNotificationSectionsOn: aCanvas

	"Render dialog and notification sections. These are needed for the dialog and notification support."

	aCanvas div
		id: WillowConstants dialogSectionName;
		class: WillowCssStyles dialogContainer.
	aCanvas div id: WillowConstants notificationSectionName