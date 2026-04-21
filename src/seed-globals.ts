import { getPayload } from 'payload'
import config from './payload.config'
import 'dotenv/config'

const seedGlobals = async () => {
  const payload = await getPayload({ config })

  console.log('Seeding globals...')

  await payload.create({
    global: 'config',
    data: {
      brandingName: 'Mulya Plastindo',
      homeTitle: 'Your Trusted Partner',
      homeDescription: '<p>Description</p>',
      navbarLogo: null,
    },
  })

  await payload.create({
    global: 'hero',
    data: { headline: '<p>Welcome</p>', description: '<p>Description</p>' },
  })

  await payload.create({
    global: 'introduction',
    data: {
      titleIntroduction: '<p>Title</p>',
      labelIntroduction: '<p>Label</p>',
      descriptionIntroduction: '<p>Desc</p>',
    },
  })

  await payload.create({
    global: 'page-about',
    data: { vision: '<p>Vision</p>', mission: '<p>Mission</p>', description: '<p>About</p>' },
  })

  await payload.create({
    global: 'page-contact',
    data: { company: 'Mulya', email: 'info@test.com', phone: '08123456789', address: '<p>Address</p>' },
  })

  console.log('Globals seeded!')
  process.exit(0)
}

seedGlobals().catch(console.error)
