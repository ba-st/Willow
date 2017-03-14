*Willow-JQueryUI
showJQueryUILoadingNotification

	| classes |

	classes := Array
		with: WillowCssStyles topPageNotification
		with: JQueryCssStyles uiStateFocus
		with: JQueryCssStyles uiWidget
		with: JQueryCssStyles uiWidgetHeader
		with: JQueryCssStyles uiCornerAll.
	self showLoadingNotificationStyledAsAll: classes