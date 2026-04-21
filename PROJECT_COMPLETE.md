# Laravel to Payload CMS Migration - Complete Documentation

## Project Overview

Migrated "plasticseeds" Laravel API to Payload CMS 3.0 with Next.js 16.

**Tech Stack:**
- Payload CMS 3.83.0
- Next.js 16.2.3
- PostgreSQL
- React 19

## Collections Created (10 Total)

### Core Collections
- `ArticleCategories` - Blog categorization
- `ProductCategories` - Product categorization  
- `Tags` - Article tagging (many-to-many)
- `Articles` - Blog posts with relationships
- `Products` - Product catalog with specs

### Supporting Collections
- `Customers` - Customer testimonials/logos
- `Recycles` - Recycling process steps
- `PlasticTypes` - Material types
- `ProductRequests` - Product inquiry forms (public)
- `Recommendations` - Cross-content linking system

## Globals Created (5 Total)

- `Config` - Site branding, colors, SEO metadata
- `Hero` - Homepage hero section
- `Introduction` - All section labels/titles (8 sections)
- `PageAbout` - About page content
- `PageContact` - Contact page info

## File Structure

```
src/
├── collections/
│   ├── ArticleCategories.ts
│   ├── Articles.ts
│   ├── Customers.ts
│   ├── Media.ts              # Built-in
│   ├── ProductCategories.ts
│   ├── ProductRequests.ts
│   ├── Products.ts
│   ├── Recommendations.ts
│   ├── Recycles.ts
│   ├── Tags.ts
│   ├── PlasticTypes.ts
│   └── Users.ts              # Built-in
├── globals/
│   ├── Config.ts
│   ├── Hero.ts
│   ├── Introduction.ts
│   ├── PageAbout.ts
│   └── PageContact.ts
├── payload.config.ts         # Main configuration
├── seed.ts                   # Seed all data
├── seed-globals.ts           # Seed globals only
├── test-api.ts               # Test collections
└── test-globals.ts           # Test globals
```

## API Reference

### REST API (Auto-generated)

```bash
# Collections
GET  /api/articles              # List all
GET  /api/articles/{id}         # Get one
POST /api/articles              # Create (auth)

GET  /api/products
GET  /api/products/{id}

GET  /api/article-categories
GET  /api/product-categories
GET  /api/tags
GET  /api/customers
GET  /api/recycles
GET  /api/plastic-types
GET  /api/recommendations

POST /api/product-requests      # Public form

# Globals (single records)
GET  /api/config
GET  /api/hero
GET  /api/introduction
GET  /api/page-about
GET  /api/page-contact
```

### GraphQL API

```graphql
# Endpoint: /api/graphql
# Playground: /api/graphql-playground

query GetArticles {
  Articles(where: { status: { equals: "1" } }) {
    docs {
      id
      title
      slug
      category { name }
      tags { name }
    }
  }
}

query GetProductsWithRecommendations {
  Products {
    docs {
      title
      slug
      bestSeller
    }
  }
}
```

### Custom Endpoints

```bash
# Pageview Tracking
POST /api/pageview
{ "type": "article" | "product", "id": "uuid" }
```

## Usage Examples

### Frontend (Client-side)

```typescript
// REST API fetch
const articles = await fetch('http://localhost:3000/api/articles')
  .then(r => r.json())

// GraphQL fetch
const response = await fetch('http://localhost:3000/api/graphql', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    query: `query { Articles { docs { title slug } } }`
  })
})
```

### Backend (Server-side)

```typescript
import { getPayload } from 'payload'
import config from '@/payload.config'

const payload = await getPayload({ config })

// Find
const articles = await payload.find({
  collection: 'articles',
  where: { status: { equals: '1' } },
  depth: 2,
})

// Create
await payload.create({
  collection: 'articles',
  data: { title: 'New Article', status: '1' },
})
```

## Laravel to Payload Mapping

| Laravel Endpoint | Payload REST | Payload GraphQL |
|-----------------|--------------|-----------------|
| `api/articles/list` | `GET /api/articles` | `query { Articles { docs { title } } }` |
| `api/articles/detail` | `GET /api/articles/{id}` | `query Articles(id: "123") { docs { title } }` |
| `api/articles/recommendation` | `GET /api/recommendations?where[article][equals]={id}` | Custom query needed |
| `api/products/list` | `GET /api/products` | `query { Products { docs { title } } }` |
| `api/products/detail` | `GET /api/products/{id}` | `query Products(id: "123")` |
| `api/products/recommendation` | `GET /api/recommendations?where[product][equals]={id}` | Custom query needed |
| `api/category/list` | `GET /api/article-categories` | `query { ArticleCategories { docs { name } } }` |
| `api/configs/list` | `GET /api/config` | `query { Config { brandingName } }` |
| `api/contact-us/list` | `GET /api/page-contact` | `query { PageContact { company } }` |
| `api/customers/list` | `GET /api/customers` | `query { Customers { docs { company } } }` |
| `api/hero/list` | `GET /api/hero` | `query { Hero { headline } }` |
| `api/introduction/list` | `GET /api/introduction` | `query { Introduction { titleIntroduction } }` |
| `api/plastic_types/list` | `GET /api/plastic-types` | `query { PlasticTypes { docs { name } } }` |
| `api/product-requests` | `POST /api/product-requests` | Mutation needed |
| `api/recycles/list` | `GET /api/recycles` | `query { Recycles { docs { title } } }` |
| `api/pageview` | `POST /api/pageview` | Custom endpoint |

## Commands

```bash
# Development
bun dev                          # Start dev server
bun run generate:types           # Regenerate TypeScript types

# Database
yes | bun run seed               # Seed all data (auto-accepts schema)
bun tsx src/seed-globals.ts      # Seed globals only

# Testing
bun tsx src/test-api.ts          # Test all collections
bun tsx src/test-globals.ts      # Test globals
```

## Status

✅ Phase 1: Core Collections  
✅ Phase 2: Supporting Collections  
✅ Phase 3: Recommendations System  
✅ Phase 4: API Routes (Built-in REST + GraphQL)  
✅ Phase 5: Pageview Tracking  

## Next Steps

1. **Frontend Development** - Build pages using Payload data
2. **Admin Customization** - Customize `/admin` panel
3. **Additional Features** - Add more collections as needed
