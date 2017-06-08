Container-API
changeModelTo: aModel

	^ self textField changeContentsTo: (self textCodec encode: aModel)