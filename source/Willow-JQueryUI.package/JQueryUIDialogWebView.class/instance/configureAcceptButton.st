configuring - private
configureAcceptButton

	self onTrigger
		serializeChildForm;
		executeOnClient:
				[ :aScript :canvas | aScript << (self functionToRemoveComponentOn: canvas) ]