Utility
registerAsApplication

	| application |

	application := WAAdmin register: self asApplicationAt: self handlerName.
	application preferenceAt: #sessionClass put: self sessionClass.
	^ application