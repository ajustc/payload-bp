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

### Phase 3: Recommendations System
- `Recommendations` - Links content for cross-promotion

## Globals Created

- `Config` - Site branding, colors, page titles/descriptions
- `Hero` - Homepage hero section
- `Introduction` - All section labels/titles
- `PageAbout` - About page content
- `PageContact` - Contact page content

## Payload Built-in APIs (No Custom Routes Needed)

**REST API** - Auto-generated at `/api/{collection-slug}`

```bash
GET  /api/articles              # List articles
GET  /api/articles/{id}         # Get single article
POST /api/articles              # Create (auth required)
PATCH /api/articles/{id}        # Update (auth required)
DELETE /api/articles/{id}       # Delete (auth required)

GET  /api/products              # List products
GET  /api/products/{id}         # Get single product
GET  /api/article-categories    # List categories
GET  /api/customers             # List customers
GET  /api/recycles              # List recycles
GET  /api/plastic-types         # List plastic types
POST /api/product-requests      # Submit inquiry (public)
```

**GraphQL API** - Auto-generated at `/api/graphql`

```graphql
# Get published articles with category and tags
query GetArticles {
  Articles(where: { status: { equals: "1" } }) {
    docs {
      id
      title
      slug
      teaser
      category { name slug }
      tags { name }
      photoPath { url filename }
    }
  }
}

# Get single article by slug
query GetArticle($slug: String!) {
  Articles(where: { slug: { equals: $slug } }) {
    docs {
      title
      content
      publishedAt
    }
  }
}

# Get products with recommendations
query GetProducts {
  Products {
    docs {
      title
      slug
      bestSeller
      color
    }
  }
}
```

**Frontend Examples:**

```typescript
// REST API call
const articles = await fetch('http://localhost:3000/api/articles?where[status][equals]=1')
  .then(r => r.json())

// GraphQL call
const response = await fetch('http://localhost:3000/api/graphql', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    query: `query { Articles(docs) { title slug } }`
  })
})

// Local API (server components only)
import { getPayload } from 'payload'
import config from '@/payload.config'

const payload = await getPayload({ config })
const articles = await payload.find({
  collection: 'articles',
  where: { status: { equals: '1' } },
  depth: 2, // Populate relationships
})
```

## Special Endpoint: Pageview Tracking

**Created at:** `src/app/api/pageview/route.ts`

```bash
POST /api/pageview
Body: { type: 'article' | 'product', id: string }
```

## How to Add New Collection

1. Create `src/collections/YourCollection.ts`
2. Import in `src/payload.config.ts`
3. Add to `collections` array
4. Run `bun run generate:types`
5. Use `bun run seed` to populate dummy data

## API Reference

| Laravel Endpoint | Payload REST | Notes |
|-----------------|--------------|-------|
| `api/articles/list` | `GET /api/articles` | Use `?where[status][equals]=1` |
| `api/articles/detail` | `GET /api/articles/{id}` | Or use slug filter |
| `api/products/list` | `GET /api/products` | - |
| `api/products/detail` | `GET /api/products/{id}` | - |
| `api/category/list` | `GET /api/article-categories` | - |
| `api/configs/list` | `GET /api/config` | Global (single record) |
| `api/contact-us/list` | `GET /api/page-contact` | Global |
| `api/customers/list` | `GET /api/customers` | - |
| `api/hero/list` | `GET /api/hero` | Global |
| `api/introduction/list` | `GET /api/introduction` | Global |
| `api/plastic_types/list` | `GET /api/plastic-types` | - |
| `api/product-requests` | `POST /api/product-requests` | - |
| `api/recycles/list` | `GET /api/recycles` | - |
| `api/articles/recommendation` | Query `recommendations` collection | Use relationship filters |
| `api/products/recommendation` | Query `recommendations` collection | Use relationship filters |
