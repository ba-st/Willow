"
A FloatCodecTest is a test class for testing the behavior of FloatCodec
"
Class {
	#name : #FloatCodecTest,
	#superclass : #TestCase,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #tests }
FloatCodecTest >> testDecode [

	self
		assert: (FloatCodec new decode: '0.0') equals: 0.0;
		assert: (FloatCodec new decode: '-1.0') equals: -1.0;
		assert: (FloatCodec new decode: '99') equals: 99.0;
		assert: (FloatCodec new decode: '0.01') equals: 0.01;
		should: [FloatCodec new decode: 'xxx0.01'] raise: InstanceCreationFailed
]

{ #category : #tests }
FloatCodecTest >> testEncode [

	self
		assert: (FloatCodec new encode: 0) equals: '0.0';
		assert: (FloatCodec new encode: -1) equals: '-1.0';
		assert: (FloatCodec new encode: 99) equals: '99.0';
		assert: (FloatCodec new encode: 0.01) equals: '0.01';
		assert: (FloatCodec new encode: -1.365) equals: '-1.365'
]

{ #category : #tests }
FloatCodecTest >> testEncodingDecoding [

	| codec |

	codec := FloatCodec new.

	self
		assert: (codec canCreate: 232 / 100);
		assert: (codec canCreate: 2.32)
]
