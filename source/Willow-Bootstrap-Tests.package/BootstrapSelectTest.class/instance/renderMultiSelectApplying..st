private
renderMultiSelectApplying: aBlock

	^ self
		renderUsing: [ :canvas | 
			| select bootstrapSelect |

			select := canvas multiSelect.
			select list: #(1 2 3).
			bootstrapSelect := canvas jQuery new bootstrapSelect.
			aBlock value: bootstrapSelect.
			select script: bootstrapSelect ]