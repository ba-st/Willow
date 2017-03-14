rendering
renderContentOn: aCanvas

	| fieldSet |

	fieldSet := aCanvas fieldSet.
	fieldSetCommand applyTo: fieldSet on: aCanvas.
	fieldSet
		with: [ | legend |

			legend := aCanvas legend.
			legendCommand applyTo: legend on: aCanvas.
			legend with: title.
			aCanvas render: contentView ]