Interaction
closeDialogsIn: aDialogSectionJQuery suppliedBy: dialogSupplier on: aCanvas

	^ (dialogSupplier value: (aDialogSectionJQuery children: 'dialog')) removeAttribute: 'open'