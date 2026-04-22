# Phase 6 Frontend - Complete Documentation

## Tech Stack
- **Framework**: Next.js 16.2.3 with App Router
- **Styling**: Tailwind CSS 4.2.4 + @tailwindcss/postcss
- **Font**: Inter (Google Fonts)
- **Data**: Payload Local API (Server Components)

## Pages Created

### Root Layout
**File:** `src/app/(frontend)/layout.tsx`
- Dynamic metadata from Payload Config global
- Server-side data fetching for Navbar/Footer
- Inter font integration
- Tailwind CSS styles

### Homepage
**File:** `src/app/(frontend)/page.tsx`
- Hero section (Hero global)
- About section (Introduction global)
- Customers section (Customers collection)
- Articles section (Articles collection)
- Recycles section (Recycles collection)

### Articles Pages
**Files:**
- `src/app/(frontend)/articles/page.tsx` - Article listing
- `src/app/(frontend)/articles/[slug]/page.tsx` - Article detail
  - Displays article content
  - Shows related articles and products
  - Increments pageview

### Products Pages
**Files:**
- `src/app/(frontend)/products/page.tsx` - Product listing
- `src/app/(frontend)/products/[slug]/page.tsx` - Product detail
  - Product specifications
  - After application photos
  - Related products and articles
  - Increments pageview

### About & Contact
**Files:**
- `src/app/(frontend)/about/page.tsx` - Uses page-about global
- `src/app/(frontend)/contact/page.tsx` - Uses page-contact global + product request form

### Error Pages
**Files:**
- `src/app/(frontend)/error.tsx` - Runtime error boundary
- `src/app/(frontend)/not-found.tsx` - 404 page

## Components Created

### Layout Components
- `Navbar.tsx` - Server component, receives config as props
- `Footer.tsx` - Server component, receives config as props

### Section Components
- `sections/Hero.tsx` - Hero section
- `sections/About.tsx` - Introduction/about content
- `sections/Customers.tsx` - Customer logos
- `sections/Articles.tsx` - Article cards
- `sections/Recycles.tsx` - Recycling process

### Card Components
- `ArticleCard.tsx` - Article preview card
- `ProductCard.tsx` - Product preview card

## Data Fetching Pattern

All pages use Payload Local API (server components):

```typescript
import { getPayload } from 'payload'
import config from '@/payload.config'

const payload = await getPayload({ config })
const data = await payload.find({ collection: 'articles' })
```

## Styling with Tailwind CSS

### Configuration Files
- `tailwind.config.ts` - Tailwind configuration
- `postcss.config.js` - PostCSS with @tailwindcss/postcss
- `src/app/(frontend)/styles.css` - Global styles with `@import "tailwindcss"`

### Common Tailwind Classes Used
- Layout: `max-w-7xl mx-auto px-4 sm:px-6 lg:px-8`
- Grid: `grid grid-cols-1 md:grid-cols-3 gap-8`
- Cards: `border border-gray-200 rounded-lg overflow-hidden`
- Buttons: `px-6 py-3 bg-indigo-500 text-white rounded-lg`
- Typography: `text-5xl font-bold`, `text-xl`, `text-gray-600`

## SEO & Metadata

Dynamic metadata using Payload globals:

```typescript
export async function generateMetadata() {
  const payload = await getPayload({ config })
  const config = await payload.findGlobal({ slug: 'config' })

  return {
    title: config.homeTitle,
    description: config.homeDescription,
  }
}
```

## Pageview Tracking

Automatic pageview increment on detail pages:

```typescript
await fetch('/api/pageview', {
  method: 'POST',
  body: JSON.stringify({ type: 'article', id: article.id }),
})
```

## API Endpoints Used

- `/api/articles` - GET articles
- `/api/products` - GET products
- `/api/config` - GET config global
- `/api/hero` - GET hero global
- `/api/introduction` - GET introduction global
- `/api/page-about` - GET page-about global
- `/api/page-contact` - GET page-contact global
- `/api/pageview` - POST for tracking
- `/api/product-requests` - POST for contact form

## Environment Variables

Add to `.env`:
```bash
DATABASE_URL=mongodb://127.0.0.1/your-database-name
PAYLOAD_SECRET=YOUR_SECRET_HERE
NEXT_PUBLIC_SERVER_URL=http://localhost:3000
```

## File Structure

```
src/app/(frontend)/
├── components/
│   ├── Navbar.tsx
│   ├── Footer.tsx
│   ├── ArticleCard.tsx
│   ├── ProductCard.tsx
│   └── sections/
│       ├── Hero.tsx
│       ├── About.tsx
│       ├── Customers.tsx
│       ├── Articles.tsx
│       └── Recycles.tsx
├── articles/
│   ├── page.tsx
│   └── [slug]/
│       └── page.tsx
├── products/
│   ├── page.tsx
│   └── [slug]/
│       └── page.tsx
├── about/
│   └── page.tsx
├── contact/
│   └── page.tsx
├── layout.tsx
├── page.tsx
├── error.tsx
├── not-found.tsx
└── styles.css
```

## Routes

- `/` - Homepage
- `/about` - About page
- `/contact` - Contact page
- `/articles` - Articles listing
- `/articles/{slug}` - Article detail
- `/products` - Products listing
- `/products/{slug}` - Product detail
- `/admin` - Payload admin panel

## Test Results

All frontend pages tested and working:
- ✅ Homepage (`/`) - 200 OK
- ✅ About page (`/about`) - 200 OK
- ✅ Products listing (`/products`) - 200 OK
- ✅ Articles listing (`/articles`) - 200 OK
- ✅ Contact page (`/contact`) - 200 OK
- ✅ Admin panel (`/admin`) - 200 OK
- ✅ Error pages - Configured

## Features Implemented

✅ Server components with Payload Local API
✅ Tailwind CSS 4.x styling
✅ Dynamic SEO metadata from globals
✅ Responsive design (mobile-first)
✅ Pageview tracking on detail pages
✅ Related content recommendations
✅ Contact form with ProductRequests
✅ All sections integrated with Payload data
✅ Error handling (error.tsx, not-found.tsx)
✅ No client-side Payload imports

## Development Commands

```bash
bun dev              # Start dev server
bun run build        # Production build
bun start            # Start production server
bun run seed         # Seed database with dummy data
```

## Troubleshooting

### Tailwind CSS Not Working
- Ensure `@tailwindcss/postcss` is installed
- Check `postcss.config.js` uses ES module syntax
- Verify `styles.css` has `@import "tailwindcss"`

### Payload Import Error
- Navbar and Footer must be server components
- Layout fetches data server-side and passes as props
- No `getPayload` calls in client components

### Detail Pages Not Found
- Seed database first: `bun run seed`
- Check slugs exist in database
- Verify status is set to "1" (published)
