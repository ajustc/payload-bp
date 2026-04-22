import { getPayload } from 'payload'
import config from '@/payload.config'

export default async function Recycles() {
  const payload = await getPayload({ config })
  const intro = await payload.findGlobal({ slug: 'introduction' })
  const recycles = await payload.find({
    collection: 'recycles',
    sort: 'sorting',
  })

  return (
    <section className="py-16 bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2
            className="text-4xl font-bold mb-2"
            dangerouslySetInnerHTML={{ __html: intro?.titleRecycles || '<p>Our Process</p>' }}
          />
          <p
            className="text-gray-600"
            dangerouslySetInnerHTML={{ __html: intro?.labelRecycles || '<p>How we work</p>' }}
          />
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {recycles.docs.map((recycle: any) => (
            <div
              key={recycle.id}
              className="flex gap-4 p-6 border border-gray-200 rounded-lg bg-white"
            >
              <div className="text-3xl font-bold text-indigo-500">
                {String(recycle.sorting).padStart(2, '0')}
              </div>
              <div>
                <h3
                  className="text-lg font-semibold mb-2"
                  dangerouslySetInnerHTML={{ __html: recycle.title }}
                />
                <p
                  className="text-gray-600 text-sm"
                  dangerouslySetInnerHTML={{ __html: recycle.description }}
                />
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
