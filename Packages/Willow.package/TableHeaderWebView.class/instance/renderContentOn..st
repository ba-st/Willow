rendering
renderContentOn: aCanvas

	aCanvas tableHead: [ columnRenderers do: [ :renderer | renderer renderHeadingOn: aCanvas ] ]