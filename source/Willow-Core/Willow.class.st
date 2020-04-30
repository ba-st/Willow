"
I'm a shared pool providing access to constants and classes defined by the lilbrary
"
Class {
	#name : #Willow,
	#superclass : #SharedPool,
	#classVars : [
		'Classification',
		'Constants'
	],
	#pools : [
		'RenoirSt'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #accessing }
Willow class >> classification [

	^ Classification
]

{ #category : #accessing }
Willow class >> constants [

	^ Constants
]

{ #category : #initialization }
Willow class >> initialize [

	<ignoreForCoverage>
	self initializeConstants.
	self initializeClasses
]

{ #category : #'private - initialization' }
Willow class >> initializeARIAConstants [

	"Checkout https://www.w3.org/TR/wai-aria/#roles_categorization"

	<ignoreForCoverage>
	Constants bind: #aria to: Namespace new.
	self
		initializeWidgetRoles;
		initializeDocumentStructureRoles;
		initializeLandmarkRoles;
		initializeLiveRegionRoles;
		initializeWindowRoles
]

{ #category : #'private - initialization' }
Willow class >> initializeClasses [

	<ignoreForCoverage>
	Classification := Namespace new.
	Classification
		bind: #fadingNotification to: 'willow-fading-notification';
		bind: #loading to: 'willow-loading';
		bind: #dialogContainer to: 'willow-dialog-container';
		bind: #willow to: 'willow';
		bind: #disabledComponent to: 'willow-disabled-component'
]

{ #category : #'private - initialization' }
Willow class >> initializeConstants [

	<ignoreForCoverage>
	Constants := Namespace new.
	Constants bind: #css to: CssConstants.
	Constants bind: #willow to: Namespace new.
	(Constants >> #willow)
		bind: #callServerFunctionName to: 'callServer';
		bind: #disabledAttributeName to: 'disabled';
		bind: #handleAjaxErrorCallFunctionName to: 'handleAjaxErrorCall';
		bind: #notificationSectionName to: 'willow-notification-section';
		bind: #dialogSectionName to: 'willow-dialog-section'.
	self initializeARIAConstants
]

{ #category : #'private - initialization' }
Willow class >> initializeDocumentStructureRoles [

	<ignoreForCoverage>
	(Constants >> #aria)
		bind: #application to: 'application';
		bind: #article to: 'article';
		bind: #cell to: 'cell';
		bind: #columnHeader to: 'columnheader';
		bind: #definition to: 'definition';
		bind: #directory to: 'directory';
		bind: #document to: 'document';
		bind: #feed to: 'feed';
		bind: #figure to: 'figure';
		bind: #group to: 'group';
		bind: #heading to: 'heading';
		bind: #image to: 'img';
		bind: #list to: 'list';
		bind: #listItem to: 'listitem';
		bind: #math to: 'math';
		bind: #none to: 'none';
		bind: #note to: 'note';
		bind: #presentation to: 'presentation';
		bind: #row to: 'row';
		bind: #rowGroup to: 'rowgroup';
		bind: #rowHeader to: 'rowheader';
		bind: #table to: 'table';
		bind: #term to: 'term';
		bind: #toolbar to: 'toolbar';
		bind: #tooltip to: 'tooltip'
]

{ #category : #'private - initialization' }
Willow class >> initializeLandmarkRoles [

	<ignoreForCoverage>
	(Constants >> #aria)
		bind: #banner to: 'banner';
		bind: #complementary to: 'complementary';
		bind: #contentInfo to: 'contentinfo';
		bind: #form to: 'form';
		bind: #main to: 'main';
		bind: #navigation to: 'navigation';
		bind: #region to: 'region';
		bind: #search to: 'search'
]

{ #category : #'private - initialization' }
Willow class >> initializeLiveRegionRoles [

	<ignoreForCoverage>
	(Constants >> #aria)
		bind: #alert to: 'alert';
		bind: #log to: 'log';
		bind: #marquee to: 'marquee';
		bind: #status to: 'status';
		bind: #timer to: 'timer'
]

{ #category : #'private - initialization' }
Willow class >> initializeWidgetRoles [

	<ignoreForCoverage>
	(Constants >> #aria)
		bind: #button to: 'button';
		bind: #checkbox to: 'checkbox';
		bind: #gridCell to: 'gridcell';
		bind: #link to: 'link';
		bind: #menuItem to: 'menuitem';
		bind: #menuItemCheckbox to: 'menuitemcheckbox';
		bind: #menuItemRadio to: 'menuitemradio';
		bind: #option to: 'option';
		bind: #progressbar to: 'progressbar';
		bind: #radio to: 'radio';
		bind: #scrollbar to: 'scrollbar';
		bind: #searchbox to: 'searchbox';
		bind: #separator to: 'separator';
		bind: #slider to: 'slider';
		bind: #spinButton to: 'spinbutton';
		bind: #switch to: 'switch';
		bind: #tab to: 'tab';
		bind: #tabPanel to: 'tabpanel';
		bind: #textbox to: 'textbox';
		bind: #treeItem to: 'treeitem';
		bind: #combobox to: 'combobox';
		bind: #grid to: 'grid';
		bind: #listbox to: 'listbox';
		bind: #menu to: 'menu';
		bind: #menubar to: 'menubar';
		bind: #radioGroup to: 'radiogroup';
		bind: #tabList to: 'tablist';
		bind: #tree to: 'tree';
		bind: #treegrid to: 'treegrid'
]

{ #category : #'private - initialization' }
Willow class >> initializeWindowRoles [

	<ignoreForCoverage>
	(Constants >> #aria)
		bind: #alertDialog to: 'alertdialog';
		bind: #dialog to: 'dialog'
]
