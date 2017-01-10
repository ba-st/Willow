instance creation
toggling: aCssStyle onComponentFoundWith: aComponentProvider

	^ self altering: aCssStyle sending: #toggleClass: toComponentFoundWith: aComponentProvider