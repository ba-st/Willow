private
assertRenderingOf: aComponentCreationBlock equals: anExpectedHtml

	| component html |

	component := aComponentCreationBlock value: Html5ComponentSupplier new.

	html := self render: component.

	self assert: html equals: anExpectedHtml