Building
setStyleTo: aBlockClosure

	^ SetComponentStyleCommand setting: (aBlockClosure value: CssDeclarationBlock new)