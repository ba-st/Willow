private
applyStyleChangeTo: component
	^ component
		perform: self transformationMessage
		with: self styleToChange