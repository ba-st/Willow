private-Utility
registerAsApplicationUsing: deploymentModeClass

	| application |

	application := WAAdmin register: self asApplicationAt: self handlerName.
	application preferenceAt: #sessionClass put: self sessionClass.
	application filter configuration at: #exceptionHandler put: self errorHandlerFactory.
	application configuration addParent: WillowSystemConfiguration instance.
	application preferenceAt: WillowSystemConfiguration deploymentModeClassKey put: deploymentModeClass.
	self installFileHandlerAccordingTo: deploymentModeClass new.
	^ application