utility
renderUsing: aMonadycBlock

	| builder html |

	builder :=
		WAHtmlCanvas builder
			fullDocument: false;
			codec: self codec.
	html :=
		builder render: [:canvas |
			[aMonadycBlock cull: canvas] on: WACurrentRequestContext do: [:ex | ex resume: self]].
	^html