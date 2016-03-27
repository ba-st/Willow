rendering
renderContentOn: aCanvas

	aCanvas div
		class: ERAAdventuringCssStyles fixHeaderTableHeader;
		with: [ self renderTableHeaderOn: aCanvas ].
	aCanvas div
		class: ERAAdventuringCssStyles fixHeaderTableBody;
		with: [ self renderTableBodyOn: aCanvas ]