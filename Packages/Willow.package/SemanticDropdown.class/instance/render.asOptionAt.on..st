rendering - private
render: option asOptionAt: index on: aCanvas

	aCanvas div
		class: SemanticStyle for item;
		attributeAt: 'data-value' put: index;
		with: option