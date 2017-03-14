instance creation
ofType: aMimeType base64EncodedAs: imageInBase64 applying: aComponentCommand

	^ self locatedAt: ('data:<1s>;base64,<2s>' expandMacrosWith: aMimeType greaseString with: imageInBase64) applying: aComponentCommand