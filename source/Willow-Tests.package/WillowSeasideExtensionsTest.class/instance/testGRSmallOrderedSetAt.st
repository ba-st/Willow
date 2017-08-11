tests
testGRSmallOrderedSetAt

	| orderedSet |

	orderedSet := GRSmallOrderedSet new.
	orderedSet
		add: 'a';
		add: 'a';
		add: 'c';
		add: 'b';
		add: 'c';
		add: 'a'.
	self
		assert: (orderedSet at: 1) equals: 'a';
		assert: (orderedSet at: 2) equals: 'c';
		assert: (orderedSet at: 3) equals: 'b'