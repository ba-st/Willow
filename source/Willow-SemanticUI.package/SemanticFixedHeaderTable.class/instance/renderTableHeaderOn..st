rendering - private
renderTableHeaderOn: aCanvas

	aCanvas table
		class: SemanticStyle ui definition fixed table;
		with: [ aCanvas tableHead: [ self renderTableHeadingsOn: aCanvas ] ]