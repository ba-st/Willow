accessing
tableShowing: aColumnDefinitionCollection obtainingContentsFrom: aContentsProvider styledAs: aCssStyle

	| styleCommand styles |

	styles := self borderedWidgetCssStyles
		add: aCssStyle;
		yourself.
	styleCommand := CssStyleCommand toStyleWithAll: styles.
	^ TableWebView
		showing: aColumnDefinitionCollection
		obtainingContentsFrom: aContentsProvider
		applyingAll: (Array with: styleCommand)