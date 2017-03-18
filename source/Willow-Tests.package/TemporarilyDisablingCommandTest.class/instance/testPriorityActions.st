tests-accessing
testPriorityActions

	| command html |

	command := TemporarilyDisablingCommand transformingCurrentViewInto: [ :canvas | canvas span class: WillowCssStyles loading ].
	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall div |

			asynchronousCall := canvas jQuery ajax.
			command priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals:
			'<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){$.ajax({"data":[disabledComponent=$(this).html(),$(this).addClass("willow-disabled-component").attr("disabled",true).html("<span class=\"willow-loading\"></span>")].join("&"),"complete":function(){$(".willow-disabled-component").attr("disabled",false).removeClass("willow-disabled-component").html(disabledComponent)}})});</script>'