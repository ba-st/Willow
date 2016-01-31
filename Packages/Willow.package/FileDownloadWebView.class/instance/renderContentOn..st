rendering
renderContentOn: aCanvas

	(aCanvas span)
		class: style;
		with: [self renderAnchorOn: aCanvas]