import { getPayload } from 'payload'
import config from './payload.config'
import 'dotenv/config'

const test = async () => {
  const payload = await getPayload({ config })

  console.log('🧪 Testing Payload Collections...\n')

  // Test Articles
  console.log('📝 Articles:')
  const articles = await payload.find({ collection: 'articles', depth: 1 })
  console.log(`  Found ${articles.docs.length} articles`)
  if (articles.docs[0]) {
    console.log(`  Sample: ${articles.docs[0].title}`)
  }

  // Test Products
  console.log('\n📦 Products:')
  const products = await payload.find({ collection: 'products', depth: 1 })
  console.log(`  Found ${products.docs.length} products`)
  if (products.docs[0]) {
    console.log(`  Sample: ${products.docs[0].title}`)
  }

  // Test Article Categories
  console.log('\n📁 Article Categories:')
  const categories = await payload.find({ collection: 'article-categories' })
  console.log(`  Found ${categories.docs.length} categories`)
  if (categories.docs[0]) {
    console.log(`  Sample: ${categories.docs[0].name}`)
  }

  // Test Product Categories
  console.log('\n📁 Product Categories:')
  const productCats = await payload.find({ collection: 'product-categories' })
  console.log(`  Found ${productCats.docs.length} product categories`)
  if (productCats.docs[0]) {
    console.log(`  Sample: ${productCats.docs[0].title}`)
  }

  // Test Tags
  console.log('\n🏷️  Tags:')
  const tags = await payload.find({ collection: 'tags' })
  console.log(`  Found ${tags.docs.length} tags`)
  if (tags.docs[0]) {
    console.log(`  Sample: ${tags.docs[0].name}`)
  }

  // Test Customers
  console.log('\n👥 Customers:')
  const customers = await payload.find({ collection: 'customers' })
  console.log(`  Found ${customers.docs.length} customers`)
  if (customers.docs[0]) {
    console.log(`  Sample: ${customers.docs[0].company}`)
  }

  // Test Recycles
  console.log('\n♻️  Recycles:')
  const recycles = await payload.find({ collection: 'recycles' })
  console.log(`  Found ${recycles.docs.length} recycles`)

  // Test Plastic Types
  console.log('\n🔬 Plastic Types:')
  const plasticTypes = await payload.find({ collection: 'plastic-types' })
  console.log(`  Found ${plasticTypes.docs.length} plastic types`)
  if (plasticTypes.docs[0]) {
    console.log(`  Sample: ${plasticTypes.docs[0].name}`)
  }

  // Test Recommendations
  console.log('\n🔗 Recommendations:')
  const recommendations = await payload.find({ collection: 'recommendations', depth: 1 })
  console.log(`  Found ${recommendations.docs.length} recommendations`)

  // Test Globals
  console.log('\n⚙️  Globals:')
  const configGlobal = await payload.findGlobal({ slug: 'config' })
  console.log(`  Config: ${configGlobal.brandingName || 'Not set'}`)

  const hero = await payload.findGlobal({ slug: 'hero' })
  console.log(`  Hero: ${hero.headline ? 'Set' : 'Not set'}`)

  const intro = await payload.findGlobal({ slug: 'introduction' })
  console.log(`  Introduction: ${intro.titleIntroduction ? 'Set' : 'Not set'}`)

  const pageAbout = await payload.findGlobal({ slug: 'page-about' })
  console.log(`  PageAbout: ${pageAbout.vision ? 'Set' : 'Not set'}`)

  const pageContact = await payload.findGlobal({ slug: 'page-contact' })
  console.log(`  PageContact: ${pageContact.company ? 'Set' : 'Not set'}`)

  console.log('\n✅ All collections tested successfully!')

  process.exit(0)
}

test().catch((err) => {
  console.error('❌ Test failed:', err)
  process.exit(1)
})
