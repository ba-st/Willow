rendering - private
renderBodyOn: aCanvas

	| contents |

	contents := self contents.
	aCanvas tableBody: [ contents do: [ :element | self renderRowFor: element on: aCanvas ] ]