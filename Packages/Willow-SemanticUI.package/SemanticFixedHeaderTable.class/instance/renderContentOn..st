rendering
renderContentOn: aCanvas

	aCanvas div
		class: WillowCssStyles fixHeaderTableHeader;
		with: [ self renderTableHeaderOn: aCanvas ].
	aCanvas div
		class: WillowCssStyles fixHeaderTableBody;
		with: [ self renderTableBodyOn: aCanvas ]