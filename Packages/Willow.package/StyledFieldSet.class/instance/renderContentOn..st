rendering
renderContentOn: aCanvas

	(aCanvas fieldSet)
		class: CssStyles uiWidget;
		class: CssStyles uiWidgetContent;
		classes: additionalStyles;
		with: 
				[(aCanvas legend)
					class: CssStyles uiWidgetHeader;
					class: CssStyles uiCornerAll;
					with: title.
				aCanvas render: contentView]