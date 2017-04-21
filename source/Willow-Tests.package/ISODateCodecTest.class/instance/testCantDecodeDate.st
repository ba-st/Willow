tests
testCantDecodeDate

	self
		should: [ ISODateCodec new decode: '2010-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2010-13-32' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2017-02-29' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '1-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '10-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '010-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2010-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2010-1-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2010-13-1' ] raise: InstanceCreationFailed