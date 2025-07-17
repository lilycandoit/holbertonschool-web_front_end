
# CSS Advanced Styling – Learning Notes

This document summarizes key concepts and my implementation experience from working through the `styles/32-style.css` task. It includes foundational CSS layout knowledge, hover behaviors, pseudo-elements, transitions, and common mistakes I learned to avoid.

---

## 🔧 Key CSS Concepts Reviewed

### 1. **Positioning and Layout**

#### `position: relative` (on parent)
- Establishes a reference point for **absolutely positioned children**.
- It does **not move** the element by itself.
- Needed when using `position: absolute` inside child elements.

#### `position: absolute` (on child)
- Positions the element **relative to the nearest `relative` ancestor**.
- Use `top`, `right`, `bottom`, `left` to place exactly.
- Example:
  ```css
  .parent {
    position: relative;
  }

  .child {
    position: absolute;
    top: 0;
    left: 0;
  }


---

### 2. **Overflow and Z-Index**

#### `overflow: hidden`

* Clips anything that visually overflows the container.
* Useful for hover zoom effects or cropped edges.

#### `z-index`

* Controls stacking order.
* Higher value = placed in front.
* Only works on positioned elements (`relative`, `absolute`, etc.).
* Negative `z-index` can place elements **behind** others.

---

### 3. **Opacity and Visibility**

#### `opacity: 0`

* Makes the element **invisible** but still keeps it in layout.
* Often used for hover reveal transitions.

#### With hover:

```css
.card-title {
  opacity: 0;
  transition: opacity 0.3s ease;
}

.card-title:hover {
  opacity: 1;
}
```

---

## 🎭 Pseudo-elements (`::before`, `::after`)

### Use Case

* Insert virtual content before/after elements.
* Requires `content: ""` or specific character.

### Example

```css
.card-quote::before {
  content: "\201C"; /* Unicode open quote */
  position: absolute;
  top: -4.5rem;
  left: -1rem;
  font-size: 10rem;
  color: #efeded;
  z-index: -1;
}
```

---

## 🎬 Transitions and Animations

### Use `transition` on base element – not just on `:hover`!

Correct:

```css
.card-image {
  transition: transform 0.3s ease;
}

.card-work:hover .card-image {
  transform: scale(1.2);
}
```

### Shorthand with CSS variables:

```css
transition: var(--transition-duration) var(--transition-cubic-bezier);
```

> ⚠️ Even though the checker may ask for `transition` inside the `:hover` selector, it **should be placed on the base class** to actually work. To pass the checker and keep functionality, you can add it to both.

---

## ✨ Utility Techniques

### Make top, right, bottom, left = 0 (no shortcut, must be written out)

```css
top: 0;
right: 0;
bottom: 0;
left: 0;
```

### Center-align text and remove margins

```css
text-align: center;
margin: 0;
```

---

## 💡 Debugging & Takeaways

* `transition` must be applied to the original element, **not just in `:hover`**.
* Check for **typos in variables** (e.g., `--transition-duration`, not `--transition-duration;`).
* When `content` is not showing in `::before`, ensure `position` is correct and `z-index` is not hiding it.
* Use `::before` when adding decorative elements (e.g., quotes), unless specifically asked for `::after`.

---

## 🗂 Common Selectors Used

```css
.card-work .card-outer { position: relative; overflow: hidden; }

.card-work .card-image { position: absolute; bottom: 0; object-fit: cover; height: 30rem; }

.card-work:hover .card-image { transform: scale(1.2); transition: var(--transition-duration) var(--transition-cubic-bezier); }

.card-title { opacity: 0; height: 100%; text-align: center; margin: 0; }

.card-title:hover { opacity: 1; }

.card-title a::after {
  position: absolute;
  top: 0; right: 0; bottom: 0; left: 0;
  content: "";
}
```

---

## ✅ Task-Specific CSS Variables

```css
:root {
  --transition-duration: 0.3s;
  --transition-cubic-bezier: cubic-bezier(0.17, 0.67, 0, 1.01);
}
```

---

## 📌 Summary

This task taught me how to:

* Handle positioning strategies (`relative`/`absolute`)
* Use transitions correctly with shorthand and custom variables
* Apply visual decorations with `::before`
* Handle hover-based UI interactions
* Write CSS that both works and satisfies automated checkers (sometimes by duplicating logic)

This README will serve as my go-to reference for future HTML + CSS layout and styling work.

