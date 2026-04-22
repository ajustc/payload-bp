import { getPayload } from 'payload'
import config from '@/payload.config'

export default async function About() {
  const payload = await getPayload({ config })
  const intro = await payload.findGlobal({ slug: 'introduction' })

  return (
    <section className="py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="max-w-3xl mx-auto">
          <h2
            className="text-4xl font-bold text-center mb-8"
            dangerouslySetInnerHTML={{ __html: intro?.titleIntroduction || '<p>Welcome</p>' }}
          />
          <p
            className="text-lg text-gray-600 mb-4"
            dangerouslySetInnerHTML={{ __html: intro?.descriptionIntroduction || '<p>Description</p>' }}
          />
          <p
            className="text-lg text-gray-600"
            dangerouslySetInnerHTML={{ __html: intro?.descriptionAbout || '<p>About content</p>' }}
          />
        </div>
      </div>
    </section>
  )
}
