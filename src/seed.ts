import { getPayload } from 'payload'
import config from './payload.config'
import 'dotenv/config'

const seed = async (): Promise<void> => {
  const payload = await getPayload({ config })

  console.log('Seeding...')

  await payload.create({ collection: 'article-categories', data: { name: 'PP', code: 'PP' } })
  await payload.create({ collection: 'article-categories', data: { name: 'ABS', code: 'ABS' } })
  await payload.create({ collection: 'tags', data: { name: 'Recycling' } })
  await payload.create({ collection: 'tags', data: { name: 'Industry' } })
  await payload.create({ collection: 'customers', data: { company: 'PT Test', email: 'test@test.com' } })
  await payload.create({ collection: 'recycles', data: { title: '<p>Step 1</p>', description: '<p>Desc</p>', sorting: 1 } })
  await payload.create({ collection: 'plastic-types', data: { name: 'Polypropylene' } })
  await payload.create({ collection: 'plastic-types', data: { name: 'ABS' } })

  // Recommendations
  const articles = await payload.find({ collection: 'articles' })
  const products = await payload.find({ collection: 'products' })

  if (articles.docs.length >= 2) {
    await payload.create({
      collection: 'recommendations',
      data: { article: articles.docs[0].id, recommendationArticle: articles.docs[1].id, sorting: 1 },
    })
  }
  if (products.docs.length >= 1 && articles.docs.length >= 1) {
    await payload.create({
      collection: 'recommendations',
      data: { article: articles.docs[0].id, recommendationProduct: products.docs[0].id, sorting: 1 },
    })
  }
  if (products.docs.length >= 2) {
    await payload.create({
      collection: 'recommendations',
      data: { product: products.docs[0].id, recommendationProduct: products.docs[1].id, sorting: 1 },
    })
  }

  console.log('Done!')
  process.exit(0)
}

seed().catch(console.error)
