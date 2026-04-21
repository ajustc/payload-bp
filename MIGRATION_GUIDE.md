# Laravel to Payload CMS Migration Guide

## Collections Created

### Phase 1: Core Collections
- `ArticleCategories` - Blog categories
- `ProductCategories` - Product categories  
- `Tags` - Article tags
- `Articles` - Blog posts with categories, tags, author
- `Products` - Products with categories, specs, photos

### Phase 2: Supporting Collections
- `Customers` - Customer testimonials/logos
- `Recycles` - Recycling process steps
- `PlasticTypes` - Plastic material types
- `ProductRequests` - Product inquiry forms (public submission)

## Globals Created

- `Config` - Site branding, colors, page titles/descriptions
- `Hero` - Homepage hero section
- `Introduction` - All section labels/titles (tabs: Intro, About, Products, Categories, Customers, Articles, Recycles, Services)
- `PageAbout` - About page content
- `PageContact` - Contact page content

## How to Add New Collection

```bash
# 1. Create collection file
src/collections/YourCollection.ts

import type { CollectionConfig } from 'payload'

export const YourCollection: CollectionConfig = {
  slug: 'your-collection',
  admin: { useAsTitle: 'name' },
  fields: [
    { name: 'name', type: 'text', required: true },
    // more fields...
  ],
}
```

```typescript
// 2. Import in payload.config.ts
import { YourCollection } from './collections/YourCollection'

// 3. Add to collections array
collections: [Users, Media, YourCollection, ...],
```

```bash
# 4. Regenerate types
bun run generate:types
```

## How to Add New Global

```bash
# 1. Create global file
src/globals/YourGlobal.ts

import type { GlobalConfig } from 'payload'

export const YourGlobal: GlobalConfig = {
  slug: 'your-global',
  fields: [
    { name: 'title', type: 'text' },
    // more fields...
  ],
}
```

```typescript
// 2. Import in payload.config.ts
import { YourGlobal } from './globals/YourGlobal'

// 3. Add to globals array
globals: [Config, Hero, YourGlobal, ...],
```

```bash
# 4. Regenerate types
bun run generate:types
```

## How to Seed Dummy Data

```typescript
// src/seed.ts
import { getPayload } from 'payload'
import config from './payload.config'

const seed = async () => {
  const payload = await getPayload({ config })

  // Collection
  await payload.create({
    collection: 'your-collection',
    data: { name: 'Test', field: 'value' },
  })

  // Global
  await payload.create({
    global: 'your-global',
    data: { title: 'Default Title' },
  })

  process.exit(0)
}

seed().catch(console.error)
```

```bash
# Run seed (auto-accepts schema changes)
yes | bun run seed
```

## API Reference

### Local API (Server-side)
```typescript
import { getPayload } from 'payload'
import config from '@/payload.config'

const payload = await getPayload({ config })

// Find
const items = await payload.find({ collection: 'articles' })

// Create
await payload.create({ collection: 'articles', data: {...} })

// Update
await payload.update({ collection: 'articles', id: '123', data: {...} })

// Delete
await payload.delete({ collection: 'articles', id: '123' })
```

### REST API
- `GET /api/articles` - List all
- `GET /api/articles/:id` - Get one
- `POST /api/articles` - Create (needs auth)
- `PATCH /api/articles/:id` - Update (needs auth)
- `DELETE /api/articles/:id` - Delete (needs auth)

### GraphQL API
- `POST /api/graphql` - GraphQL endpoint
- Access `/api/graphql-playground` for IDE
