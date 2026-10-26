import { Calendar } from 'vanilla-calendar-pro'

init_calendars()

function init_calendars() {
	var ranged = new Calendar('#calendar', {
		firstWeekday: 0,
		selectedWeekends: [],
		selectionDatesMode: 'multiple-ranged',
		onClickDate: show_range
	})
	ranged.init()
	var field = new Calendar('#calendar-input', {
		firstWeekday: 0,
		selectedWeekends: [],
		inputMode: true,
		onChangeToInput: fill_input
	})
	field.init()
	return ranged
}

function show_range(self) {
	var dates = self.context.selectedDates
	var text = 'Select a start date and an end date.'
	if (dates.length == 1) {
		text = dates[0]
	} else if (dates.length > 1) {
		text = dates[0] + ' through ' + dates[dates.length - 1]
	}
	$('#picked').text(text)
	return text
}

function fill_input(self) {
	var dates = self.context.selectedDates
	var text = dates.length ? dates[dates.length - 1] : ''
	self.context.inputElement.value = text
	self.hide()
	return text
}
