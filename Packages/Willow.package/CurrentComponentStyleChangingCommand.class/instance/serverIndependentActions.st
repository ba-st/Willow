accessing
serverIndependentActions

	^ Array with: [ :aScript :aCanvas | aScript << aCanvas jQuery this perform: transformationMessage with: styleToChange ]