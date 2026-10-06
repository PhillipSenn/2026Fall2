const url = new URL(window.location.href);

if (url.searchParams.has("accordion")) {
	$('ul').addClass('list-unstyled')
	
	let accordionID = 0;
	
	document.querySelectorAll("li > ul").forEach(function (ul) {
	
		 const li = ul.parentElement;
	
		 const textNode = Array.from(li.childNodes).find(function (node) {
			  return node.nodeType === Node.TEXT_NODE && node.textContent.trim();
		 });
	
		 if (!textNode) return;
	
		 accordionID++;
	
		 const id = "accordionItem" + accordionID;
		 const collapseID = "collapse" + accordionID;
	
		 const accordion = document.createElement("div");
		 accordion.className = "accordion";
	
		 const item = document.createElement("div");
		 item.className = "accordion-item";
	
		 const header = document.createElement("h2");
		 header.className = "accordion-header";
	
		 const button = document.createElement("button");
		 button.className = "accordion-button collapsed";
		 button.type = "button";
		 button.setAttribute("data-bs-toggle", "collapse");
		 button.setAttribute("data-bs-target", "#" + collapseID);
		 button.setAttribute("aria-expanded", "false");
		 button.setAttribute("aria-controls", collapseID);
	
		 button.textContent = textNode.textContent.trim();
	
		 const collapse = document.createElement("div");
		 collapse.id = collapseID;
		 collapse.className = "accordion-collapse collapse";
	
		 const body = document.createElement("div");
		 body.className = "accordion-body";
	
		 textNode.remove();
	
		 li.replaceChild(accordion, ul);
	
		 header.appendChild(button);
		 item.appendChild(header);
	
		 body.appendChild(ul);
		 collapse.appendChild(body);
	
		 item.appendChild(collapse);
		 accordion.appendChild(item);
	});
}
