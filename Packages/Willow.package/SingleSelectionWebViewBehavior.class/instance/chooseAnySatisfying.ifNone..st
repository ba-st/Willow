Single Selection-API
chooseAnySatisfying: aMatchBlock ifNone: aBlock

	availableElements detect: aMatchBlock ifFound: [ :found | self choose: found ] ifNone: aBlock