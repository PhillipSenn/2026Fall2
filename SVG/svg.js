var selected = null
var minSize = 8
var credited = {}
var drag = {
	active: false,
	moved: false,
	mode: '',
	el: null,
	handle: '',
	lastX: 0,
	lastY: 0,
	startBox: null,
	startAttrs: null,
	shift: false,
	center: null,
	localCenter: null,
	startAngle: 0,
	startRotation: 0
}
var current = {
	qid: 0,
	qname: '',
	tag: '',
	attrs: {}
}

;(function load_credited() {
	var raw = $('#credited-qids').text()
	var list
	var i
	if (!raw) {
		return
	}
	list = JSON.parse(raw)
	for (i = 0; i < list.length; i++) {
		credited[+list[i]] = true
	}
}())
var handleCursors = {
	nw: 'nwse-resize',
	n: 'ns-resize',
	ne: 'nesw-resize',
	e: 'ew-resize',
	se: 'nwse-resize',
	s: 'ns-resize',
	sw: 'nesw-resize',
	w: 'ew-resize'
}

var shapeDefaults = {
	Rectangle: {
		tag: 'rect',
		attrs: { x: '40', y: '40', width: '160', height: '100', rx: '0', ry: '0' }
	},
	Circle: {
		tag: 'circle',
		attrs: { cx: '200', cy: '150', r: '70' }
	},
	Elipse: {
		tag: 'ellipse',
		attrs: { cx: '200', cy: '150', rx: '120', ry: '70' }
	},
	Ellipse: {
		tag: 'ellipse',
		attrs: { cx: '200', cy: '150', rx: '120', ry: '70' }
	},
	Line: {
		tag: 'line',
		attrs: { x1: '40', y1: '40', x2: '360', y2: '260', 'stroke-width': '4' }
	},
	Polyline: {
		tag: 'polyline',
		attrs: { points: '40,220 120,80 200,180 280,60 360,220', 'stroke-width': '4', fill: 'none' }
	},
	Polygon: {
		tag: 'polygon',
		attrs: { points: '200,40 270,70 300,140 270,210 200,240 130,210 100,140 130,70' }
	},
	Path: {
		tag: 'path',
		attrs: {
			d: [
				'M 40 180',
				'L 70 90',
				'Q 120 20 180 70',
				'C 220 110 240 30 300 50',
				'L 360 110',
				'C 340 170 300 210 250 200',
				'Q 200 190 170 230',
				'C 140 270 90 250 60 210',
				'Z'
			].join(' ')
		}
	},
	Image: {
		tag: 'image',
		attrs: {
			x: '120',
			y: '30',
			width: '160',
			height: '240',
			href: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/250px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg'
		}
	},
	Triangle: {
		tag: 'polygon',
		attrs: { points: '200,40 340,260 60,260' }
	},
	Star: {
		tag: 'polygon',
		attrs: { points: '200,30 230,120 330,120 250,180 280,270 200,210 120,270 150,180 70,120 170,120' }
	}
}

var tagToQname = {
	rect: 'Rectangle',
	circle: 'Circle',
	ellipse: 'Elipse',
	line: 'Line',
	polyline: 'Polyline',
	polygon: 'Polygon',
	path: 'Path',
	image: 'Image'
}

$('.shape-link').on('click', choose_shape)
$('#fillColor').on('input', sync_fill_from_picker)
$('#fillValue').on('input', sync_fill_from_text)
$('#fillNone').on('change', toggle_fill_none)
$('#strokeColor').on('input', sync_stroke_from_picker)
$('#strokeValue').on('input', sync_stroke_from_text)
$('#strokeNone').on('change', toggle_stroke_none)
$('#filterSelect').on('change', sync_filter)
$('#addShape').on('click', add_shape)
$('#deleteShape').on('click', delete_selected)
$('#attr-body').on('input', '.attr-name, .attr-value', attrs_changed)
$('#attr-body').on('click', '.remove-attr', remove_attr)
$('#svgCanvas').on('click', canvas_click)
$('#svgCanvas').on('pointerdown', shape_pointer_down)
$('#svgCanvas').on('contextmenu', block_context_menu)
$(document).on('pointermove', shape_pointer_move)
$(document).on('pointerup pointercancel', shape_pointer_up)

ensure_selection_ui()
choose_first_shape()

function ensure_selection_ui() {
	var svg = $('#svgCanvas')[0]
	var ns = 'http://www.w3.org/2000/svg'
	var group
	var box
	var handles = ['nw', 'n', 'ne', 'e', 'se', 's', 'sw', 'w']
	var i
	var handle
	if ($('#selectionUI').length) {
		return $('#selectionUI')
	}
	group = document.createElementNS(ns, 'g')
	group.setAttribute('id', 'selectionUI')
	group.setAttribute('class', 'selection-ui')
	group.setAttribute('display', 'none')
	box = document.createElementNS(ns, 'rect')
	box.setAttribute('class', 'selection-box')
	box.setAttribute('fill', 'none')
	box.setAttribute('stroke', '#0d6efd')
	box.setAttribute('stroke-width', '1')
	box.setAttribute('stroke-dasharray', '4 3')
	box.setAttribute('pointer-events', 'none')
	group.appendChild(box)
	for (i = 0; i < handles.length; i++) {
		handle = document.createElementNS(ns, 'rect')
		handle.setAttribute('class', 'resize-handle')
		handle.setAttribute('data-handle', handles[i])
		handle.setAttribute('width', '8')
		handle.setAttribute('height', '8')
		handle.setAttribute('fill', '#fff')
		handle.setAttribute('stroke', '#0d6efd')
		handle.setAttribute('stroke-width', '1')
		handle.style.cursor = handleCursors[handles[i]]
		group.appendChild(handle)
	}
	svg.appendChild(group)
	return $(group)
}

function choose_first_shape() {
	var first = $('.shape-link').first()
	if (!first.length) {
		return
	}
	first.trigger('click')
	return first.data('qname')
}

function choose_shape(response) {
	response.preventDefault()
	var qname = String($(this).data('qname') || '')
	var qid = +$(this).data('qid') || 0
	var def = shapeDefaults[qname]
	if (!def) {
		def = {
			tag: qname.toLowerCase(),
			attrs: {}
		}
	}
	clear_selection()
	$('.shape-link').removeClass('active')
	$(this).addClass('active')
	current.qid = qid
	current.qname = qname
	current.tag = def.tag
	current.attrs = $.extend({}, def.attrs)
	apply_paint_defaults()
	render_attr_rows()
	update_source()
	set_edit_mode(false)
	return qname
}

function canvas_click(response) {
	var target = response.target
	if (drag.moved) {
		drag.moved = false
		return false
	}
	if ($(target).hasClass('resize-handle') || $(target).closest('.selection-ui').length) {
		return false
	}
	if (!target || target === this || $(target).hasClass('svg-bg') || !$(target).hasClass('shape')) {
		clear_selection()
		update_source()
		set_edit_mode(false)
		return false
	}
	select_shape(target)
	return false
}

function block_context_menu(response) {
	response.preventDefault()
	return false
}

function shape_pointer_down(response) {
	var target = response.target
	var point
	var handle
	var box
	var rot
	if (!target) {
		return
	}
	handle = $(target).attr('data-handle')
	if (handle && selected && response.button === 0) {
		response.preventDefault()
		point = svg_point(response.clientX, response.clientY)
		drag.active = true
		drag.moved = false
		drag.mode = 'resize'
		drag.el = selected
		drag.handle = handle
		drag.lastX = point.x
		drag.lastY = point.y
		drag.startBox = shape_bbox(selected)
		drag.startAttrs = attrs_from_element(selected)
		drag.shift = !!response.shiftKey
		$('#svgCanvas').addClass('is-resizing')
		if (target.setPointerCapture) {
			target.setPointerCapture(response.pointerId)
		}
		return false
	}
	if (!$(target).hasClass('shape')) {
		return
	}
	response.preventDefault()
	select_shape(target)
	point = svg_point(response.clientX, response.clientY)
	drag.active = true
	drag.moved = false
	drag.el = target
	drag.handle = ''
	drag.lastX = point.x
	drag.lastY = point.y
	drag.shift = !!response.shiftKey
	if (response.button === 2) {
		box = shape_bbox(target)
		rot = parse_rotate(target.getAttribute('transform'))
		drag.mode = 'rotate'
		drag.localCenter = local_center(target)
		if (rot && rot.cx !== null && rot.cy !== null) {
			drag.localCenter = { x: rot.cx, y: rot.cy }
		}
		drag.center = transform_point_to_svg(target, drag.localCenter.x, drag.localCenter.y)
		drag.startAngle = pointer_angle(point, drag.center)
		drag.startRotation = rot ? rot.angle : 0
		drag.startBox = box
		drag.startAttrs = attrs_from_element(target)
		$('#svgCanvas').addClass('is-rotating')
	} else {
		drag.mode = 'move'
		drag.center = null
		drag.localCenter = null
		drag.startBox = null
		drag.startAttrs = null
		$('#svgCanvas').addClass('is-dragging')
	}
	if (target.setPointerCapture) {
		target.setPointerCapture(response.pointerId)
	}
	return false
}

function shape_pointer_move(response) {
	var point
	var dx
	var dy
	var nextBox
	var angle
	var nextRotation
	if (!drag.active || !drag.el) {
		return
	}
	point = svg_point(response.clientX, response.clientY)
	drag.shift = !!response.shiftKey
	if (drag.mode === 'resize') {
		nextBox = resize_box_from_handle(drag.handle, drag.startBox, point, drag.shift)
		if (Math.abs(nextBox.width - drag.startBox.width) > 0.5 || Math.abs(nextBox.height - drag.startBox.height) > 0.5 || Math.abs(nextBox.x - drag.startBox.x) > 0.5 || Math.abs(nextBox.y - drag.startBox.y) > 0.5) {
			drag.moved = true
		}
		apply_bbox_resize(drag.el, drag.startAttrs, drag.startBox, nextBox, drag.shift)
		refresh_form_from_selected()
		update_selection_ui()
		return false
	}
	if (drag.mode === 'rotate') {
		angle = pointer_angle(point, drag.center)
		nextRotation = drag.startRotation + (angle - drag.startAngle)
		if (drag.shift) {
			nextRotation = Math.round(nextRotation / 15) * 15
		}
		if (Math.abs(nextRotation - drag.startRotation) > 0.5) {
			drag.moved = true
		}
		set_rotate(drag.el, nextRotation, drag.localCenter.x, drag.localCenter.y)
		refresh_form_from_selected()
		update_selection_ui()
		return false
	}
	dx = point.x - drag.lastX
	dy = point.y - drag.lastY
	if (!dx && !dy) {
		return
	}
	if (Math.abs(dx) > 0.5 || Math.abs(dy) > 0.5) {
		drag.moved = true
	}
	move_shape(drag.el, dx, dy)
	drag.lastX = point.x
	drag.lastY = point.y
	refresh_form_from_selected()
	update_selection_ui()
	return false
}

function shape_pointer_up(response) {
	if (!drag.active) {
		return
	}
	drag.active = false
	drag.mode = ''
	drag.el = null
	drag.handle = ''
	drag.startBox = null
	drag.startAttrs = null
	drag.center = null
	drag.localCenter = null
	$('#svgCanvas').removeClass('is-dragging is-resizing is-rotating')
	refresh_form_from_selected()
	update_selection_ui()
	return false
}

function svg_point(clientX, clientY) {
	var svg = $('#svgCanvas')[0]
	var point = svg.createSVGPoint()
	var matrix = svg.getScreenCTM()
	point.x = clientX
	point.y = clientY
	if (!matrix) {
		return point
	}
	return point.matrixTransform(matrix.inverse())
}

function move_shape(el, dx, dy) {
	var tag = el.tagName.toLowerCase()
	var rot
	if (tag === 'rect' || tag === 'image') {
		shift_attr(el, 'x', dx)
		shift_attr(el, 'y', dy)
	} else if (tag === 'circle' || tag === 'ellipse') {
		shift_attr(el, 'cx', dx)
		shift_attr(el, 'cy', dy)
	} else if (tag === 'line') {
		shift_attr(el, 'x1', dx)
		shift_attr(el, 'y1', dy)
		shift_attr(el, 'x2', dx)
		shift_attr(el, 'y2', dy)
	} else if (tag === 'polyline' || tag === 'polygon') {
		el.setAttribute('points', shift_points(el.getAttribute('points') || '', dx, dy))
	} else if (tag === 'path') {
		el.setAttribute('d', shift_path_d(el.getAttribute('d') || '', dx, dy))
	}
	rot = parse_rotate(el.getAttribute('transform'))
	if (rot && rot.cx !== null && rot.cy !== null) {
		set_rotate(el, rot.angle, rot.cx + dx, rot.cy + dy)
	}
	return el
}

function pointer_angle(point, center) {
	return Math.atan2(point.y - center.y, point.x - center.x) * 180 / Math.PI
}

function local_center(el) {
	var box = el.getBBox()
	return {
		x: box.x + box.width / 2,
		y: box.y + box.height / 2
	}
}

function transform_point_to_svg(el, x, y) {
	var svg = $('#svgCanvas')[0]
	var point = svg.createSVGPoint()
	var matrix
	point.x = x
	point.y = y
	if (!svg.getScreenCTM || !el.getScreenCTM) {
		return { x: x, y: y }
	}
	matrix = svg.getScreenCTM().inverse().multiply(el.getScreenCTM())
	point = point.matrixTransform(matrix)
	return { x: point.x, y: point.y }
}

function parse_rotate(transform) {
	var match = String(transform || '').match(/rotate\(\s*([+-]?(?:\d+\.?\d*|\.\d+)(?:e[+-]?\d+)?)\s*(?:[,\s]+\s*([+-]?(?:\d+\.?\d*|\.\d+)(?:e[+-]?\d+)?)\s*[,\s]+\s*([+-]?(?:\d+\.?\d*|\.\d+)(?:e[+-]?\d+)?))?\s*\)/i)
	if (!match) {
		return null
	}
	return {
		angle: parseFloat(match[1]) || 0,
		cx: match[2] === undefined ? null : parseFloat(match[2]),
		cy: match[3] === undefined ? null : parseFloat(match[3])
	}
}

function set_rotate(el, angle, cx, cy) {
	angle = round_num(((angle % 360) + 360) % 360)
	if (angle > 359.9) {
		angle = 0
	}
	el.setAttribute('transform', 'rotate(' + angle + ' ' + round_num(cx) + ' ' + round_num(cy) + ')')
	return el
}

function shape_bbox(el) {
	var svg = $('#svgCanvas')[0]
	var box = el.getBBox()
	var matrix
	var corners
	var i
	var point
	var xs = []
	var ys = []
	var minX
	var maxX
	var minY
	var maxY
	if (!svg.getScreenCTM || !el.getScreenCTM) {
		return {
			x: box.x,
			y: box.y,
			width: Math.max(box.width, 0.0001),
			height: Math.max(box.height, 0.0001)
		}
	}
	matrix = svg.getScreenCTM().inverse().multiply(el.getScreenCTM())
	corners = [
		{ x: box.x, y: box.y },
		{ x: box.x + box.width, y: box.y },
		{ x: box.x + box.width, y: box.y + box.height },
		{ x: box.x, y: box.y + box.height }
	]
	for (i = 0; i < corners.length; i++) {
		point = svg.createSVGPoint()
		point.x = corners[i].x
		point.y = corners[i].y
		point = point.matrixTransform(matrix)
		xs.push(point.x)
		ys.push(point.y)
	}
	minX = Math.min.apply(null, xs)
	maxX = Math.max.apply(null, xs)
	minY = Math.min.apply(null, ys)
	maxY = Math.max.apply(null, ys)
	return {
		x: minX,
		y: minY,
		width: Math.max(maxX - minX, 0.0001),
		height: Math.max(maxY - minY, 0.0001)
	}
}

function resize_box_from_handle(handle, startBox, point, shiftKey) {
	var box = {
		x: startBox.x,
		y: startBox.y,
		width: startBox.width,
		height: startBox.height
	}
	var aspect = startBox.width / startBox.height
	var right = startBox.x + startBox.width
	var bottom = startBox.y + startBox.height
	var isCorner = handle.length === 2
	var useWidth

	if (handle.indexOf('e') !== -1) {
		box.width = Math.max(minSize, point.x - startBox.x)
	}
	if (handle.indexOf('w') !== -1) {
		box.x = Math.min(point.x, right - minSize)
		box.width = right - box.x
	}
	if (handle.indexOf('s') !== -1) {
		box.height = Math.max(minSize, point.y - startBox.y)
	}
	if (handle.indexOf('n') !== -1) {
		box.y = Math.min(point.y, bottom - minSize)
		box.height = bottom - box.y
	}

	if (shiftKey && startBox.height) {
		if (isCorner) {
			useWidth = Math.abs(box.width / startBox.width) >= Math.abs(box.height / startBox.height)
			if (useWidth) {
				box.height = Math.max(minSize, box.width / aspect)
			} else {
				box.width = Math.max(minSize, box.height * aspect)
			}
			if (handle.indexOf('w') !== -1) {
				box.x = right - box.width
			} else {
				box.x = startBox.x
			}
			if (handle.indexOf('n') !== -1) {
				box.y = bottom - box.height
			} else {
				box.y = startBox.y
			}
		} else if (handle === 'e' || handle === 'w') {
			box.height = Math.max(minSize, box.width / aspect)
			box.y = startBox.y + (startBox.height - box.height) / 2
			if (handle === 'w') {
				box.x = right - box.width
			} else {
				box.x = startBox.x
			}
		} else if (handle === 'n' || handle === 's') {
			box.width = Math.max(minSize, box.height * aspect)
			box.x = startBox.x + (startBox.width - box.width) / 2
			if (handle === 'n') {
				box.y = bottom - box.height
			} else {
				box.y = startBox.y
			}
		}
	}

	box.x = round_num(box.x)
	box.y = round_num(box.y)
	box.width = round_num(Math.max(minSize, box.width))
	box.height = round_num(Math.max(minSize, box.height))
	return box
}

function apply_bbox_resize(el, startAttrs, fromBox, toBox, constrain) {
	var tag = el.tagName.toLowerCase()
	var sx = toBox.width / fromBox.width
	var sy = toBox.height / fromBox.height
	var mapX
	var mapY
	var scale
	var rot
	var cx
	var cy
	var r
	var rx
	var ry

	mapX = function(x) {
		return round_num(toBox.x + (x - fromBox.x) * sx)
	}
	mapY = function(y) {
		return round_num(toBox.y + (y - fromBox.y) * sy)
	}

	if (tag === 'rect' || tag === 'image') {
		el.setAttribute('x', mapX(num_attr(startAttrs, 'x')))
		el.setAttribute('y', mapY(num_attr(startAttrs, 'y')))
		el.setAttribute('width', round_num(Math.max(minSize, num_attr(startAttrs, 'width') * sx)))
		el.setAttribute('height', round_num(Math.max(minSize, num_attr(startAttrs, 'height') * sy)))
		if (tag === 'image') {
			ensure_image_stretch(el)
		}
		if (tag === 'rect' && startAttrs.rx !== undefined) {
			el.setAttribute('rx', round_num(num_attr(startAttrs, 'rx') * sx))
		}
		if (tag === 'rect' && startAttrs.ry !== undefined) {
			el.setAttribute('ry', round_num(num_attr(startAttrs, 'ry') * sy))
		}
	} else if (tag === 'circle') {
		cx = mapX(num_attr(startAttrs, 'cx'))
		cy = mapY(num_attr(startAttrs, 'cy'))
		r = num_attr(startAttrs, 'r')
		if (constrain || Math.abs(sx - sy) < 0.02) {
			scale = (Math.abs(sx) + Math.abs(sy)) / 2
			el.setAttribute('cx', cx)
			el.setAttribute('cy', cy)
			el.setAttribute('r', round_num(Math.max(minSize / 2, r * scale)))
		} else {
			el = replace_circle_with_ellipse(el, cx, cy, Math.max(minSize / 2, r * Math.abs(sx)), Math.max(minSize / 2, r * Math.abs(sy)), startAttrs)
			drag.el = el
			selected = el
			current.tag = 'ellipse'
			current.qname = 'Elipse'
			drag.startAttrs = $.extend({}, startAttrs)
			drag.startAttrs.rx = String(r)
			drag.startAttrs.ry = String(r)
			delete drag.startAttrs.r
			return el
		}
	} else if (tag === 'ellipse') {
		rx = startAttrs.rx !== undefined ? num_attr(startAttrs, 'rx') : num_attr(startAttrs, 'r')
		ry = startAttrs.ry !== undefined ? num_attr(startAttrs, 'ry') : num_attr(startAttrs, 'r')
		el.setAttribute('cx', mapX(num_attr(startAttrs, 'cx')))
		el.setAttribute('cy', mapY(num_attr(startAttrs, 'cy')))
		if (constrain) {
			scale = (Math.abs(sx) + Math.abs(sy)) / 2
			el.setAttribute('rx', round_num(Math.max(minSize / 2, rx * scale)))
			el.setAttribute('ry', round_num(Math.max(minSize / 2, ry * scale)))
		} else {
			el.setAttribute('rx', round_num(Math.max(minSize / 2, rx * sx)))
			el.setAttribute('ry', round_num(Math.max(minSize / 2, ry * sy)))
		}
	} else if (tag === 'line') {
		el.setAttribute('x1', mapX(num_attr(startAttrs, 'x1')))
		el.setAttribute('y1', mapY(num_attr(startAttrs, 'y1')))
		el.setAttribute('x2', mapX(num_attr(startAttrs, 'x2')))
		el.setAttribute('y2', mapY(num_attr(startAttrs, 'y2')))
	} else if (tag === 'polyline' || tag === 'polygon') {
		el.setAttribute('points', scale_points(startAttrs.points || '', mapX, mapY))
	} else if (tag === 'path') {
		el.setAttribute('d', scale_path_d(startAttrs.d || '', mapX, mapY, sx, sy))
	}

	copy_paint_attrs(el, startAttrs)
	rot = parse_rotate(startAttrs.transform)
	if (rot) {
		set_rotate(
			el,
			rot.angle,
			rot.cx === null ? toBox.x + toBox.width / 2 : mapX(rot.cx),
			rot.cy === null ? toBox.y + toBox.height / 2 : mapY(rot.cy)
		)
	}
	return el
}

function replace_circle_with_ellipse(circle, cx, cy, rx, ry, startAttrs) {
	var ns = 'http://www.w3.org/2000/svg'
	var ellipse = document.createElementNS(ns, 'ellipse')
	var qname = circle.getAttribute('data-qname') || 'Elipse'
	var qid = circle.getAttribute('data-qid')
	ellipse.setAttribute('class', circle.getAttribute('class') || 'shape')
	ellipse.setAttribute('data-qname', qname)
	if (qid) {
		ellipse.setAttribute('data-qid', qid)
	}
	ellipse.setAttribute('cx', round_num(cx))
	ellipse.setAttribute('cy', round_num(cy))
	ellipse.setAttribute('rx', round_num(rx))
	ellipse.setAttribute('ry', round_num(ry))
	copy_paint_attrs(ellipse, startAttrs)
	if (circle.parentNode) {
		circle.parentNode.replaceChild(ellipse, circle)
	}
	return ellipse
}

function num_attr(attrs, name) {
	var value = parseFloat(attrs[name])
	if (isNaN(value)) {
		return 0
	}
	return value
}

function copy_paint_attrs(el, startAttrs) {
	var skip = {
		x: 1, y: 1, width: 1, height: 1, rx: 1, ry: 1,
		cx: 1, cy: 1, r: 1,
		x1: 1, y1: 1, x2: 1, y2: 1,
		points: 1, d: 1, transform: 1
	}
	var keys = Object.keys(startAttrs)
	var i
	for (i = 0; i < keys.length; i++) {
		if (skip[keys[i]]) {
			continue
		}
		set_shape_attr(el, keys[i], startAttrs[keys[i]])
	}
	return el
}

function set_shape_attr(el, name, value) {
	el.setAttribute(name, value)
	if (name === 'href') {
		el.setAttributeNS('http://www.w3.org/1999/xlink', 'href', value)
	}
	return el
}

function ensure_image_stretch(el) {
	if (el && el.tagName && el.tagName.toLowerCase() === 'image') {
		el.setAttribute('preserveAspectRatio', 'none')
	}
	return el
}

function scale_points(points, mapX, mapY) {
	var parts = String(points).trim().split(/[\s,]+/)
	var out = []
	var i
	for (i = 0; i + 1 < parts.length; i += 2) {
		out.push(mapX(parseFloat(parts[i])) + ',' + mapY(parseFloat(parts[i + 1])))
	}
	return out.join(' ')
}

function scale_path_d(d, mapX, mapY, sx, sy) {
	var tokens = String(d).match(/[a-zA-Z]|[+-]?(?:\d+\.?\d*|\.\d+)(?:e[+-]?\d+)?/gi) || []
	var out = []
	var i = 0
	var cmd = ''
	var abs = true
	var values
	var pair
	var j
	var value
	while (i < tokens.length) {
		if (/^[a-zA-Z]$/.test(tokens[i])) {
			cmd = tokens[i]
			abs = cmd === cmd.toUpperCase()
			out.push(cmd)
			i += 1
			continue
		}
		if (!cmd) {
			i += 1
			continue
		}
		values = path_value_count(cmd)
		if (!values) {
			i += 1
			continue
		}
		for (j = 0; j < values && i < tokens.length; j += 1) {
			if (/^[a-zA-Z]$/.test(tokens[i])) {
				break
			}
			value = parseFloat(tokens[i])
			pair = path_xy_index(cmd, j)
			if (abs && pair === 'x') {
				out.push(mapX(value))
			} else if (abs && pair === 'y') {
				out.push(mapY(value))
			} else if (!abs && pair === 'x') {
				out.push(round_num(value * sx))
			} else if (!abs && pair === 'y') {
				out.push(round_num(value * sy))
			} else if (cmd.toUpperCase() === 'A' && (j === 0)) {
				out.push(round_num(value * sx))
			} else if (cmd.toUpperCase() === 'A' && (j === 1)) {
				out.push(round_num(value * sy))
			} else {
				out.push(tokens[i])
			}
			i += 1
		}
	}
	return out.join(' ').replace(/ ([Zz])/g, ' $1')
}

function update_selection_ui() {
	var ui = ensure_selection_ui()
	var box
	var pad = 1
	var size = 8
	var half = size / 2
	var positions
	if (!selected) {
		ui.attr('display', 'none')
		return false
	}
	box = shape_bbox(selected)
	ui.attr('display', null)
	ui.find('.selection-box')
		.attr('x', box.x - pad)
		.attr('y', box.y - pad)
		.attr('width', box.width + pad * 2)
		.attr('height', box.height + pad * 2)
	positions = {
		nw: [box.x, box.y],
		n: [box.x + box.width / 2, box.y],
		ne: [box.x + box.width, box.y],
		e: [box.x + box.width, box.y + box.height / 2],
		se: [box.x + box.width, box.y + box.height],
		s: [box.x + box.width / 2, box.y + box.height],
		sw: [box.x, box.y + box.height],
		w: [box.x, box.y + box.height / 2]
	}
	ui.find('.resize-handle').each(each_handle)
	$('#svgCanvas').append(ui)
	return true

	function each_handle() {
		var name = $(this).attr('data-handle')
		var pos = positions[name]
		if (!pos) {
			return
		}
		$(this)
			.attr('x', pos[0] - half)
			.attr('y', pos[1] - half)
	}
}

function shift_attr(el, name, delta) {
	var value = parseFloat(el.getAttribute(name))
	if (isNaN(value)) {
		value = 0
	}
	el.setAttribute(name, round_num(value + delta))
	return el
}

function shift_points(points, dx, dy) {
	var parts = String(points).trim().split(/[\s,]+/)
	var out = []
	var i
	for (i = 0; i + 1 < parts.length; i += 2) {
		out.push(round_num(parseFloat(parts[i]) + dx) + ',' + round_num(parseFloat(parts[i + 1]) + dy))
	}
	return out.join(' ')
}

function shift_path_d(d, dx, dy) {
	var tokens = String(d).match(/[a-zA-Z]|[+-]?(?:\d+\.?\d*|\.\d+)(?:e[+-]?\d+)?/gi) || []
	var out = []
	var i = 0
	var cmd = ''
	var abs = true
	var values
	var pair
	var j
	while (i < tokens.length) {
		if (/^[a-zA-Z]$/.test(tokens[i])) {
			cmd = tokens[i]
			abs = cmd === cmd.toUpperCase()
			out.push(cmd)
			i += 1
			continue
		}
		if (!cmd) {
			i += 1
			continue
		}
		values = path_value_count(cmd)
		if (!values) {
			i += 1
			continue
		}
		for (j = 0; j < values && i < tokens.length; j += 1) {
			if (/^[a-zA-Z]$/.test(tokens[i])) {
				break
			}
			pair = path_xy_index(cmd, j)
			if (abs && pair === 'x') {
				out.push(round_num(parseFloat(tokens[i]) + dx))
			} else if (abs && pair === 'y') {
				out.push(round_num(parseFloat(tokens[i]) + dy))
			} else {
				out.push(tokens[i])
			}
			i += 1
		}
	}
	return out.join(' ').replace(/ ([Zz])/g, ' $1')
}

function path_value_count(cmd) {
	var counts = {
		M: 2, L: 2, T: 2,
		H: 1, V: 1,
		C: 6, S: 4, Q: 4,
		A: 7, Z: 0
	}
	return counts[cmd.toUpperCase()]
}

function path_xy_index(cmd, index) {
	var upper = cmd.toUpperCase()
	if (upper === 'H') {
		return 'x'
	}
	if (upper === 'V') {
		return 'y'
	}
	if (upper === 'A') {
		if (index === 5) {
			return 'x'
		}
		if (index === 6) {
			return 'y'
		}
		return ''
	}
	if (index % 2 === 0) {
		return 'x'
	}
	return 'y'
}

function round_num(value) {
	return Math.round(value * 10) / 10
}

function refresh_form_from_selected() {
	if (!selected) {
		return false
	}
	current.attrs = attrs_from_element(selected)
	apply_paint_from_attrs()
	render_attr_rows()
	update_source()
	return true
}

function select_shape(el) {
	var attrs
	var qname
	var qid
	clear_selection()
	selected = el
	$(selected).addClass('is-selected')
	current.tag = selected.tagName.toLowerCase()
	qname = $(selected).attr('data-qname') || tagToQname[current.tag] || current.tag
	qid = +$(selected).attr('data-qid') || 0
	current.qname = qname
	current.qid = qid
	attrs = attrs_from_element(selected)
	current.attrs = attrs
	$('.shape-link').removeClass('active')
	$('.shape-link').filter(match_qname).addClass('active')
	apply_paint_from_attrs()
	render_attr_rows()
	update_source()
	set_edit_mode(true)
	update_selection_ui()
	return selected

	function match_qname() {
		return String($(this).data('qname') || '') === qname
	}
}

function clear_selection() {
	$('#svgCanvas .is-selected').removeClass('is-selected')
	selected = null
	$('#deleteShape').addClass('d-none')
	update_selection_ui()
	return null
}

function set_edit_mode(editing) {
	if (editing) {
		$('#deleteShape').removeClass('d-none')
		$('#shape-help').text('Selected shape on the canvas. Drag to move, drag a handle to resize, right-drag to rotate. Hold Shift to keep proportions or snap rotation to 15°. Each shape type is worth 10 points the first time you add it.')
	} else {
		$('#deleteShape').addClass('d-none')
		$('#shape-help').html('Choose a shape type, set <code>fill</code>, <code>stroke</code>, and <code>filter</code>, then add it. Each shape type is worth 10 points the first time you add it (10 types = 100%).')
	}
	return editing
}

function attrs_from_element(el) {
	var attrs = {}
	var i
	var name
	for (i = 0; i < el.attributes.length; i++) {
		name = el.attributes[i].name
		if (name === 'class' || name === 'data-qname' || name === 'data-qid' || name === 'preserveAspectRatio') {
			continue
		}
		attrs[name] = el.attributes[i].value
	}
	return attrs
}

function apply_attrs_to_selected() {
	var keys
	var existing
	var i
	var name
	if (!selected) {
		return false
	}
	read_attrs_from_form()
	existing = []
	for (i = 0; i < selected.attributes.length; i++) {
		name = selected.attributes[i].name
		if (name === 'class' || name === 'data-qname') {
			continue
		}
		existing.push(name)
	}
	for (i = 0; i < existing.length; i++) {
		selected.removeAttribute(existing[i])
	}
	keys = Object.keys(current.attrs)
	for (i = 0; i < keys.length; i++) {
		set_shape_attr(selected, keys[i], current.attrs[keys[i]])
	}
	ensure_image_stretch(selected)
	update_selection_ui()
	return true
}

function apply_paint_defaults() {
	var fill = current.attrs.fill
	var stroke = current.attrs.stroke
	var strokeWidth = current.attrs['stroke-width']
	var isImage = current.tag === 'image'
	if (isImage) {
		delete current.attrs.fill
		delete current.attrs.stroke
		delete current.attrs['stroke-width']
		$('#fillNone').prop('checked', false)
		$('#strokeNone').prop('checked', false)
		$('#fillColor, #fillValue, #strokeColor, #strokeValue').prop('disabled', true)
		$('#filterSelect').val(filter_id_from_value(current.attrs.filter))
		return current.attrs
	}
	$('#fillColor, #fillValue, #strokeColor, #strokeValue').prop('disabled', false)
	if (fill === 'none') {
		$('#fillNone').prop('checked', true)
		$('#fillColor, #fillValue').prop('disabled', true)
	} else {
		$('#fillNone').prop('checked', false)
		$('#fillColor, #fillValue').prop('disabled', false)
		if (is_hex_color(fill)) {
			$('#fillColor').val(normalize_hex(fill))
			$('#fillValue').val(normalize_hex(fill))
		} else if (!fill) {
			$('#fillColor').val('#3498db')
			$('#fillValue').val('#3498db')
			current.attrs.fill = '#3498db'
		} else {
			$('#fillValue').val(fill)
		}
	}
	if (stroke === 'none') {
		$('#strokeNone').prop('checked', true)
		$('#strokeColor, #strokeValue').prop('disabled', true)
	} else {
		$('#strokeNone').prop('checked', false)
		$('#strokeColor, #strokeValue').prop('disabled', false)
		if (is_hex_color(stroke)) {
			$('#strokeColor').val(normalize_hex(stroke))
			$('#strokeValue').val(normalize_hex(stroke))
		} else if (!stroke) {
			$('#strokeColor').val('#1a1a2e')
			$('#strokeValue').val('#1a1a2e')
			current.attrs.stroke = '#1a1a2e'
		} else {
			$('#strokeValue').val(stroke)
		}
	}
	if (!strokeWidth && current.tag !== 'line' && current.tag !== 'polyline') {
		current.attrs['stroke-width'] = '2'
	}
	$('#filterSelect').val(filter_id_from_value(current.attrs.filter))
	return current.attrs
}

function apply_paint_from_attrs() {
	var fill = current.attrs.fill
	var stroke = current.attrs.stroke
	if (current.tag === 'image') {
		$('#fillNone').prop('checked', false)
		$('#strokeNone').prop('checked', false)
		$('#fillColor, #fillValue, #strokeColor, #strokeValue').prop('disabled', true)
		$('#filterSelect').val(filter_id_from_value(current.attrs.filter))
		return current.attrs
	}
	$('#fillColor, #fillValue, #strokeColor, #strokeValue').prop('disabled', false)
	if (fill === 'none' || fill === undefined) {
		$('#fillNone').prop('checked', fill === 'none')
		$('#fillColor, #fillValue').prop('disabled', fill === 'none')
		if (fill !== 'none') {
			$('#fillColor').val('#3498db')
			$('#fillValue').val('')
		}
	} else if (is_hex_color(fill)) {
		$('#fillNone').prop('checked', false)
		$('#fillColor, #fillValue').prop('disabled', false)
		$('#fillColor').val(normalize_hex(fill))
		$('#fillValue').val(normalize_hex(fill))
	} else {
		$('#fillNone').prop('checked', false)
		$('#fillColor, #fillValue').prop('disabled', false)
		$('#fillValue').val(fill)
	}
	if (stroke === 'none' || stroke === undefined) {
		$('#strokeNone').prop('checked', stroke === 'none')
		$('#strokeColor, #strokeValue').prop('disabled', stroke === 'none')
		if (stroke !== 'none') {
			$('#strokeColor').val('#1a1a2e')
			$('#strokeValue').val('')
		}
	} else if (is_hex_color(stroke)) {
		$('#strokeNone').prop('checked', false)
		$('#strokeColor, #strokeValue').prop('disabled', false)
		$('#strokeColor').val(normalize_hex(stroke))
		$('#strokeValue').val(normalize_hex(stroke))
	} else {
		$('#strokeNone').prop('checked', false)
		$('#strokeColor, #strokeValue').prop('disabled', false)
		$('#strokeValue').val(stroke)
	}
	$('#filterSelect').val(filter_id_from_value(current.attrs.filter))
	return current.attrs
}

function render_attr_rows() {
	var body = $('#attr-body').empty()
	var keys = Object.keys(current.attrs)
	var i
	for (i = 0; i < keys.length; i++) {
		if (keys[i] === 'fill' || keys[i] === 'stroke' || keys[i] === 'filter' || keys[i] === 'preserveAspectRatio') {
			continue
		}
		body.append(attr_row(keys[i], current.attrs[keys[i]]))
	}
	return body
}

function attr_row(name, value) {
	var tr = $('<tr>')
	tr.append($('<td>').append(
		$('<input type="text" class="form-control form-control-sm attr-name">')
			.attr('spellcheck', false)
			.val(name)
	))
	tr.append($('<td>').append(
		$('<input type="text" class="form-control form-control-sm attr-value">')
			.attr('spellcheck', false)
			.val(value)
	))
	tr.append($('<td class="text-end">').append(
		$('<button type="button" class="btn-outline theme-danger btn-sm remove-attr">').text('Remove')
	))
	return tr
}

function remove_attr(response) {
	response.preventDefault()
	$(this).closest('tr').remove()
	read_attrs_from_form()
	apply_attrs_to_selected()
	update_source()
	return false
}

function filter_id_from_value(value) {
	var match = String(value || '').match(/^url\(#([A-Za-z0-9_-]+)\)/)
	if (!match) {
		return ''
	}
	return match[1]
}

function filter_value_from_id(id) {
	if (!id) {
		return ''
	}
	return 'url(#' + id + ')'
}

function sync_filter() {
	read_attrs_from_form()
	apply_attrs_to_selected()
	update_source()
	return $('#filterSelect').val()
}

function attrs_changed() {
	read_attrs_from_form()
	apply_attrs_to_selected()
	update_source()
	return true
}

function read_attrs_from_form() {
	var attrs = {}
	var filterId
	var isImage = current.tag === 'image'
	$('#attr-body tr').each(each_attr_row)
	if (!isImage) {
		if ($('#fillNone').prop('checked')) {
			attrs.fill = 'none'
		} else {
			attrs.fill = String($('#fillValue').val() || '').trim() || '#3498db'
		}
		if ($('#strokeNone').prop('checked')) {
			attrs.stroke = 'none'
		} else {
			attrs.stroke = String($('#strokeValue').val() || '').trim() || '#1a1a2e'
		}
	}
	filterId = String($('#filterSelect').val() || '').trim()
	if (filterId) {
		attrs.filter = filter_value_from_id(filterId)
	}
	current.attrs = attrs
	return attrs

	function each_attr_row() {
		var name = String($(this).find('.attr-name').val() || '').trim()
		var value = String($(this).find('.attr-value').val() || '').trim()
		if (!name || name === 'filter') {
			return
		}
		attrs[name] = value
	}
}

function sync_fill_from_picker() {
	var color = $('#fillColor').val()
	$('#fillValue').val(color)
	$('#fillNone').prop('checked', false)
	$('#fillColor, #fillValue').prop('disabled', false)
	read_attrs_from_form()
	apply_attrs_to_selected()
	update_source()
	return color
}

function sync_fill_from_text() {
	var value = String($('#fillValue').val() || '').trim()
	if (is_hex_color(value)) {
		$('#fillColor').val(normalize_hex(value))
	}
	$('#fillNone').prop('checked', false)
	read_attrs_from_form()
	apply_attrs_to_selected()
	update_source()
	return value
}

function toggle_fill_none() {
	var none = $('#fillNone').prop('checked')
	$('#fillColor, #fillValue').prop('disabled', none)
	read_attrs_from_form()
	apply_attrs_to_selected()
	update_source()
	return none
}

function sync_stroke_from_picker() {
	var color = $('#strokeColor').val()
	$('#strokeValue').val(color)
	$('#strokeNone').prop('checked', false)
	$('#strokeColor, #strokeValue').prop('disabled', false)
	read_attrs_from_form()
	apply_attrs_to_selected()
	update_source()
	return color
}

function sync_stroke_from_text() {
	var value = String($('#strokeValue').val() || '').trim()
	if (is_hex_color(value)) {
		$('#strokeColor').val(normalize_hex(value))
	}
	$('#strokeNone').prop('checked', false)
	read_attrs_from_form()
	apply_attrs_to_selected()
	update_source()
	return value
}

function toggle_stroke_none() {
	var none = $('#strokeNone').prop('checked')
	$('#strokeColor, #strokeValue').prop('disabled', none)
	read_attrs_from_form()
	apply_attrs_to_selected()
	update_source()
	return none
}

function markup_for(tag, attrs) {
	var parts = ['<' + tag]
	var keys = Object.keys(attrs)
	var i
	for (i = 0; i < keys.length; i++) {
		parts.push(' ' + keys[i] + '="' + escape_attr(attrs[keys[i]]) + '"')
	}
	parts.push(' />')
	return parts.join('')
}

function draft_markup() {
	if (!current.tag) {
		return ''
	}
	return [
		'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300">',
		markup_for(current.tag, current.attrs),
		'</svg>'
	].join('\n')
}

function shape_element_markup(el) {
	var attrs = attrs_from_element(el)
	if (el.tagName.toLowerCase() === 'image') {
		attrs.preserveAspectRatio = 'none'
	}
	return markup_for(el.tagName.toLowerCase(), attrs)
}

function used_filter_ids() {
	var ids = {}
	var list = []
	$('#svgCanvas .shape').each(each_shape)
	return list

	function each_shape() {
		var id = filter_id_from_value($(this).attr('filter'))
		if (!id || ids[id]) {
			return
		}
		ids[id] = true
		list.push(id)
	}
}

function filter_defs_markup(ids) {
	var lines = []
	var i
	var source
	var clone
	if (!ids.length) {
		return lines
	}
	lines.push('  <defs>')
	for (i = 0; i < ids.length; i++) {
		source = document.getElementById(ids[i])
		if (!source) {
			continue
		}
		clone = source.cloneNode(true)
		lines.push('    ' + new XMLSerializer().serializeToString(clone).replace(/\n\s*/g, ' '))
	}
	lines.push('  </defs>')
	return lines
}

function canvas_html_page() {
	var lines = [
		'<html>',
		'<body>',
		'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300">'
	]
	lines = lines.concat(filter_defs_markup(used_filter_ids()))
	$('#svgCanvas .shape').each(each_shape)
	lines.push('</svg>')
	lines.push('</body>')
	lines.push('</html>')
	return lines.join('\n')

	function each_shape() {
		lines.push('  ' + shape_element_markup(this))
	}
}

function update_source() {
	if (!selected) {
		read_attrs_from_form()
	}
	$('#svgSource').val(draft_markup())
	$('#htmlPage').val(canvas_html_page())
	return $('#svgSource').val()
}

function add_shape(response) {
	response.preventDefault()
	if (!current.tag) {
		return false
	}
	clear_selection()
	read_attrs_from_form()
	var ns = 'http://www.w3.org/2000/svg'
	var el = document.createElementNS(ns, current.tag)
	var keys = Object.keys(current.attrs)
	var i
	var qid = current.qid
	el.setAttribute('class', 'shape')
	if (current.qname) {
		el.setAttribute('data-qname', current.qname)
	}
	if (qid) {
		el.setAttribute('data-qid', qid)
	}
	for (i = 0; i < keys.length; i++) {
		set_shape_attr(el, keys[i], current.attrs[keys[i]])
	}
	ensure_image_stretch(el)
	$('#svgCanvas')[0].appendChild(el)
	select_shape(el)
	record_qid(qid)
	return true
}

function delete_selected(response) {
	response.preventDefault()
	if (!selected) {
		return false
	}
	$(selected).remove()
	clear_selection()
	choose_first_shape()
	return true
}

function record_qid(qid) {
	var url
	var form
	qid = +qid
	if (!qid || credited[qid]) {
		return
	}
	credited[qid] = true
	url = 'merge_q.cfm'
	form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('actid', app.actid)
	form.body.set('qid', qid)
	fetch(url, form)
		.then(text_done)
		.then(show_earned)
		.catch(caught(url))
}

function show_earned(response) {
	var parts = String(response || '').split('|')
	var pct = +parts[0]
	var label = parts[1] || (pct + '%')
	var bar = $('.progress-bar')
	if (isNaN(pct)) {
		return response
	}
	bar.css('width', pct + '%')
		.attr('aria-valuenow', pct)
		.text(label)
	if (pct >= 100) {
		bar.addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
	}
	return response
}

function is_hex_color(value) {
	return /^#?[0-9A-Fa-f]{6}$/.test(String(value || '').trim())
}

function normalize_hex(value) {
	value = String(value || '').trim()
	if (value.charAt(0) !== '#') {
		value = '#' + value
	}
	return value.toLowerCase()
}

function escape_attr(value) {
	return String(value)
		.replace(/&/g, '&amp;')
		.replace(/"/g, '&quot;')
		.replace(/</g, '&lt;')
}
