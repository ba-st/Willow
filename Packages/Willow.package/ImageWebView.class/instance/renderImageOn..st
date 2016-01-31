rendering - private
renderImageOn: aCanvas

	| component |

	component := aCanvas image.
	component url: LocalFileLibrary / (ImageSelectorResolver new for: imageProvider value).
	propertyCommands do: [ :command | command value: component value: aCanvas ].
	^ component