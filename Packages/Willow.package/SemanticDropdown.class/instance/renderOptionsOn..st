rendering - private
renderOptionsOn: aCanvas

	aCanvas div
		class: SemanticStyle for menu;
		with: [ options
				doWithIndex: [ :option :index | self render: option asOptionAt: index on: aCanvas ] ]