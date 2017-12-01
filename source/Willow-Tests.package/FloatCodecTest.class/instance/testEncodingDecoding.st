tests
testEncodingDecoding

	| codec |

	codec := FloatCodec new.

	self
		assert: (codec canCreate: 232 / 100);
		assert: (codec canCreate: 2.32)