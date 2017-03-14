accessing - private
complete: anAsynchronousCall withResponseOn: aCanvas

	anAsynchronousCall script: [:subScript |
		clientIndependentActions do: [:action | action value].
		modelLoadingActions do: [:action | action value: subScript value: aCanvas]]