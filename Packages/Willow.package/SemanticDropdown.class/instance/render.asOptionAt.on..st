rendering - private
render: option asOptionAt: index on: aCanvas

	aCanvas div
		class: 'item';
		attributeAt: 'data-value' put: index;
		with: option