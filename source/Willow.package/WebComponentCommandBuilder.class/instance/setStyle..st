Building
setStyle: aBlockClosure

	^ SetComponentStyleCommand setting: (aBlockClosure value: CssDeclarationBlock new)