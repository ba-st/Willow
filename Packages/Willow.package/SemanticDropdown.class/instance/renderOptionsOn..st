rendering - private
renderOptionsOn: aCanvas

	aCanvas div
		class: 'menu';
		with: [ options
				doWithIndex:
					[ :option :index | self render: option asOptionAt: index on: aCanvas ] ]