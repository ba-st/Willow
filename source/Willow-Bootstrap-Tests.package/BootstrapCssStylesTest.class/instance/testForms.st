tests
testForms

	self
		assert: BootstrapCssStyles checkbox equals: 'checkbox';
		assert: BootstrapCssStyles checkboxInline equals: 'checkbox-inline';
		assert: BootstrapCssStyles disabled equals: 'disabled';
		assert: BootstrapCssStyles formControl equals: 'form-control';
		assert: BootstrapCssStyles formControlStatic equals: 'form-control-static';
		assert: BootstrapCssStyles formGroup equals: 'form-group';
		assert: BootstrapCssStyles formGroupLarge equals: 'form-group-lg';
		assert: BootstrapCssStyles formGroupSmall equals: 'form-group-sm';
		assert: BootstrapCssStyles formHorizontal equals: 'form-horizontal';
		assert: BootstrapCssStyles formInline equals: 'form-inline';
		assert: BootstrapCssStyles helpBlock equals: 'help-block';
		assert: BootstrapCssStyles inputLarge equals: 'input-lg';
		assert: BootstrapCssStyles inputSmall equals: 'input-sm';
		assert: BootstrapCssStyles radio equals: 'radio';
		assert: BootstrapCssStyles radioInline equals: 'radio-inline'.

	self
		assert: BootstrapCssStyles hasError equals: 'has-error';
		assert: BootstrapCssStyles hasFeedback equals: 'has-feedback';
		assert: BootstrapCssStyles hasWarning equals: 'has-warning';
		assert: BootstrapCssStyles hasSuccess equals: 'has-success'