import { getPayload } from 'payload'
import config from './payload.config'
import 'dotenv/config'

const test = async () => {
  const payload = await getPayload({ config })

  console.log('Testing globals via Local API...')

  try {
    const configGlobal = await payload.findGlobal({ slug: 'config' })
    console.log('✅ Config global:', configGlobal.brandingName || 'empty')
  } catch (e) {
    console.log('❌ Config global error:', e.message)
  }

  try {
    const hero = await payload.findGlobal({ slug: 'hero' })
    console.log('✅ Hero global accessible')
  } catch (e) {
    console.log('❌ Hero global error:', e.message)
  }

  process.exit(0)
}

test()
