accessing
tableShowing: aColumnDefinitionCollection obtainingContentsFrom: aContentsProvider styledAsAll: aCssStyleCollection

	| styleCommand |

	styleCommand := CssStyleCommand toStyleWithAll: aCssStyleCollection.
	^ TableWebView
		showing: aColumnDefinitionCollection
		obtainingContentsFrom: aContentsProvider
		applying: styleCommand