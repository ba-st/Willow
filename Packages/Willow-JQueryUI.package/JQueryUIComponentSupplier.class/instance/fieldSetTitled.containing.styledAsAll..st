accessing
fieldSetTitled: aTitle containing: aWebView styledAsAll: aCssStyleCollection

	| styles fieldSetCommand legendCommand |

	styles := self widgetCssStyles
		addAll: aCssStyleCollection;
		yourself.
	fieldSetCommand := ComponentClassificationCommand toStyleWithAll: styles.
	styles := Array with: JQueryCssStyles uiWidgetHeader with: JQueryCssStyles uiCornerAll.
	legendCommand := ComponentClassificationCommand toStyleWithAll: styles.
	^ FieldSetWebView
		containing: aWebView
		applying: fieldSetCommand
		withLegend: aTitle
		applying: legendCommand