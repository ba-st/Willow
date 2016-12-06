test
testBase64String

	| imageString base64Image |

	imageString := self sampleImage.
	base64Image := ImageInBase64 fromBase64String: self sampleImage.
	self assert: base64Image base64String equals: imageString