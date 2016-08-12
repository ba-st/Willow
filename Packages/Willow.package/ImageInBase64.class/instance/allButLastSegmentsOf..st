accessing - private
allButLastSegmentsOf: aString

	^ aString groupsOf: self segmentSize atATimeCollect: [ :each | String withAll: each ]