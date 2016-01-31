rendering
renderContentOn: aCanvas

	(aCanvas div class: cssStyle)
		script:
				(aCanvas jQuery new accordion
						collapsible: true;
						icons: false;
						animate: 50;
						heightStyle: 'content';
						yourself);
		with: [ aCanvas render: contentView ]