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

  console.log('Done!')
  process.exit(0)
}

seed().catch(console.error)
