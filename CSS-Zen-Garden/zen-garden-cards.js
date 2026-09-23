const designs = [
  {
    id: 221, name: "Mid Century Modern", author: "Andrew Lohman",
    tags: ["geometric", "warm palette", "retro"],
    description: "Clean geometric shapes and a warm earth-tone palette inspired by 1950s American design. Bold sans-serif typography, structured layouts, and a sense of order with decorative flair."
  },
  {
    id: 220, name: "Garments", author: "Dan Mall",
    tags: ["editorial", "fashion", "typographic"],
    description: "Editorial fashion-magazine aesthetic. Typography is the hero — oversized display text, stark contrast, and refined whitespace create a high-fashion feel without a single image."
  },
  {
    id: 219, name: "Steel", author: "Steffen Knoeller",
    tags: ["industrial", "dark", "metallic"],
    notable: { badge: "CSS-only textures", color: "dark" },
    description: "Fakes riveted steel and brushed metal surfaces using only CSS gradients — no images at all. Almost every other design in this set relies on background images for atmosphere; Steel proves you don't need them."
  },
  {
    id: 218, name: "Apothecary", author: "Trent Walton",
    tags: ["vintage", "serif-heavy", "earthy"],
    description: "Victorian apothecary shop aesthetic. Dense serif typography, aged parchment tones, and ornamental rules and dividers evoke hand-typeset pharmaceutical labels from the 1800s."
  },
  {
    id: 217, name: "Screen Filler", author: "Elliot Jay Stocks",
    tags: ["bold", "full-bleed", "modern"],
    description: "Every element stretches edge-to-edge. Typography at huge scale fills the viewport deliberately. Contrast and spatial tension replace decorative detail."
  },
  {
    id: 216, name: "Fountain Kiss", author: "Jeremy Carlson",
    tags: ["romantic", "painterly", "flowing"],
    description: "Organic, flowing shapes and a romantic soft-focus palette. Curved containers and painterly background elements make the layout feel hand-crafted rather than constructed."
  },
  {
    id: 215, name: "A Robot Named Jimmy", author: "meltmedia",
    tags: ["playful", "illustrated", "quirky"],
    notable: { badge: "animated character", color: "warning" },
    description: "The only design in this set that builds a full animated character directly into the layout. CSS positions and animates a custom robot illustration around the content — it reads more like a game screen than a web page."
  },
  {
    id: 214, name: "Verde Moderna", author: "Dave Shea",
    tags: ["elegant", "green", "art nouveau"],
    notable: { badge: "by the creator", color: "success" },
    description: "Dave Shea's own submission to the site he built. Art Nouveau ornamental borders and a deep forest-green palette set a standard the other contributors were responding to — it's the benchmark everything else departs from."
  },
  {
    id: 213, name: "Under the Sea!", author: "Eric Stoltz",
    tags: ["aquatic", "illustrated", "layered"],
    description: "Richly illustrated underwater scene layered behind and around the text. Multiple z-index layers of coral, fish, and bubbles create parallax depth — all controlled by CSS positioning."
  },
  {
    id: 212, name: "Make 'em Proud", author: "McAghon & Reifsnyder",
    tags: ["americana", "bold", "athletic"],
    description: "Bold American sports-team aesthetic. Block typography, strong diagonal accents, and a high-contrast red-white-blue palette give it the energy of a stadium scoreboard or vintage pennant."
  },
  {
    id: 211, name: "Orchid Beauty", author: "Kevin Addison",
    tags: ["floral", "soft", "feminine"],
    description: "Delicate orchid motifs and a soft pink-lavender palette. Floating petals and curved section backgrounds are pure CSS — the layout breathes and the decoration feels woven into the structure."
  },
  {
    id: 210, name: "Oceanscape", author: "Justin Gray",
    tags: ["panoramic", "blue", "atmospheric"],
    description: "A wide, cinematic ocean horizon stretches across the top. Cool blue gradients and generous whitespace make it feel like staring out to sea — calm, spacious, and unhurried."
  },
  {
    id: 209, name: "CSS Co., Ltd.", author: "Benjamin Klemm",
    tags: ["corporate", "japanese", "structured"],
    description: "Japanese corporate design language — clean grid structure, kanji-style logotype, formal hierarchy, and a restrained monochromatic palette. Looks like a multinational annual report."
  },
  {
    id: 208, name: "Sakura", author: "Tatsuya Uchida",
    tags: ["japanese", "minimalist", "spring"],
    notable: { badge: "cultural minimalism", color: "info" },
    description: "Where CSS Co., Ltd. is Japanese in a corporate sense, Sakura is Japanese in a deeply cultural one — cherry blossoms, ink-wash tones, and wabi-sabi negative space make it the most philosophically distinct design in the set."
  },
  {
    id: 207, name: "Kyoto Forest", author: "John Politowski",
    tags: ["lush", "vertical", "nature"],
    description: "Tall bamboo grove imagery and vertical rhythms dominate. The layout scrolls like a hanging scroll painting; deep greens and vertical text spacing reinforce the forest immersion."
  },
  {
    id: 206, name: "A Walk in the Garden", author: "Simon Van Hauwermeiren",
    tags: ["illustrated", "storybook", "green"],
    description: "A hand-illustrated garden stroll. Whimsical plant and path illustrations border the content, giving it the feel of a children's book illustration rather than a web page."
  },
  {
    id: 205, name: "spring360", author: "Rene Hornig",
    tags: ["circular", "radial", "experimental"],
    notable: { badge: "breaks the grid", color: "danger" },
    description: "The only design here that completely abandons the vertical scroll. Elements orbit a central point in a radial layout — it's the most structurally experimental submission in the set and the one most likely to make you rethink what a web page can be."
  },
  {
    id: 204, name: "Withering Beauty", author: "William Duffy",
    tags: ["dark", "gothic", "decay"],
    description: "Gothic decay aesthetic. Dark backgrounds, aged textures, and wilting botanical motifs create a memento mori mood. The typography is deliberately distressed and fragile-feeling."
  },
];

function renderCards() {
  const grid = document.getElementById('zg-grid');
  grid.innerHTML = designs.map(d => `
    <div class="col">
      <div class="card h-100 zg-card" id="card-${d.id}">
        <a href="https://csszengarden.com/${d.id}/" target="_blank" rel="noopener" class="zg-thumb">
          <img src="https://csszengarden.com/content/previews/${d.id}.png" alt="${d.name} design preview"
            onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
          <div class="zg-thumb-placeholder" style="display:none;">${d.id}</div>
        </a>
        <div class="card-body d-flex flex-column gap-2">
          <div class="d-flex align-items-start justify-content-between gap-2">
            <p class="card-title zg-title mb-0">${d.name}</p>
            ${d.notable ? `<span class="badge text-bg-${d.notable.color} zg-notable-badge text-nowrap">${d.notable.badge}</span>` : ''}
          </div>
          <p class="text-muted mb-0" style="font-size:11px;">by ${d.author}</p>
          <div class="d-flex flex-wrap gap-1">
            ${d.tags.map(t => `<span class="badge rounded-pill text-bg-secondary">${t}</span>`).join('')}
          </div>
          <button class="btn btn-outline-secondary btn-sm mt-auto zg-btn" onclick="explain(${d.id})">&nearr; what makes this unique?</button>
          <div class="zg-explanation mt-1" id="exp-${d.id}"></div>
        </div>
      </div>
    </div>
  `).join('');
}

async function explain(id) {
  const design = designs.find(d => d.id === id);
  const btn = document.querySelector(`#card-${id} .zg-btn`);
  const expDiv = document.getElementById(`exp-${id}`);

  if (expDiv.classList.contains('visible')) {
    expDiv.classList.remove('visible');
    btn.innerHTML = '&nearr; what makes this unique?';
    return;
  }

  btn.disabled = true;
  btn.textContent = 'thinking...';

  const otherDesigns = designs.filter(d => d.id !== id).map(d => `- ${d.name}: ${d.tags.join(', ')}`).join('\n');

  try {
    const resp = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        model: 'claude-sonnet-4-20250514',
        max_tokens: 1000,
        messages: [{
          role: 'user',
          content: `You are an expert CSS and web design historian explaining CSS Zen Garden designs.

The design is: "${design.name}" by ${design.author}
Its character: ${design.description}
Tags: ${design.tags.join(', ')}

The other 17 designs in this set are:
${otherDesigns}

Write 2-3 sentences explaining what makes "${design.name}" distinctly different from all the others. Focus on its unique CSS technique, aesthetic philosophy, or cultural inspiration. Be specific and interesting. Do not use bullet points. Plain prose only.`
        }]
      })
    });
    const data = await resp.json();
    const text = data.content?.find(b => b.type === 'text')?.text || design.description;
    expDiv.textContent = text;
    expDiv.classList.add('visible');
    btn.innerHTML = '&uarr; hide';
  } catch (e) {
    expDiv.textContent = design.description;
    expDiv.classList.add('visible');
    btn.innerHTML = '&uarr; hide';
  }

  btn.disabled = false;
}

renderCards();
