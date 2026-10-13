settings = {}
settings.revert = 'invalid'
$('.draggable').draggable(settings)


pgm.droppable = function(response, ui) {
//	$(this).addClass('ui-state-highlight')
}
settings = {}
settings.drop = pgm.droppable
$('#GO').droppable(settings)

