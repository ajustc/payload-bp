# Tailwind CSS Setup for Payload 3.0 + Next.js 16

## Installation

```bash
bun add -D tailwindcss @tailwindcss/postcss postcss autoprefixer
```

## Configuration Files

### 1. `postcss.config.js` (ES Module syntax)
```javascript
export default {
  plugins: {
    '@tailwindcss/postcss': {},
  },
}
```

### 2. `tailwind.config.ts`
```typescript
import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
export default config
```

### 3. `src/app/(frontend)/styles.css`
```css
@import "tailwindcss";

/* Custom styles below */
```

## Important Notes

### Tailwind 4.x Changes
- Use `@import "tailwindcss"` instead of `@tailwind` directives
- Install `@tailwindcss/postcss` instead of using `tailwindcss` as PostCSS plugin
- Config file is optional for basic usage

### ES Module Project
- Since `package.json` has `"type": "module"`, use ES module syntax
- `postcss.config.js` must use `export default` not `module.exports`

### Common Issues

**Issue:** `module is not defined in ES module scope`
**Fix:** Use `export default` in `postcss.config.js`

**Issue:** `It looks like you're trying to use tailwindcss directly`
**Fix:** Install and use `@tailwindcss/postcss`

## Common Tailwind Classes Used

### Container
```html
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
  <!-- Content -->
</div>
```

### Grid Layout
```html
<div class="grid grid-cols-1 md:grid-cols-3 gap-8">
  <!-- Items -->
</div>
```

### Card
```html
<div class="border border-gray-200 rounded-lg overflow-hidden hover:shadow-lg transition">
  <!-- Card content -->
</div>
```

### Button
```html
<button class="px-6 py-3 bg-indigo-500 text-white rounded-lg hover:bg-indigo-600">
  Click me
</button>
```

### Typography
```html
<h1 class="text-5xl font-bold mb-4">Heading</h1>
<p class="text-gray-600 text-lg">Paragraph</p>
```

## Testing

Run the test script to verify all pages:
```bash
./test-pages.sh
```

All pages should return 200 OK.
