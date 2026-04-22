import { getPayload } from 'payload'
import config from '@/payload.config'
import Link from 'next/link'

export default async function Hero() {
  const payload = await getPayload({ config })
  const hero = await payload.findGlobal({ slug: 'hero' })

  return (
    <section className="bg-gradient-to-br from-indigo-500 to-purple-600 text-white py-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center">
          <h1
            className="text-5xl font-bold mb-4"
            dangerouslySetInnerHTML={{ __html: hero?.headline || '<p>Welcome</p>' }}
          />
          <p
            className="text-xl mb-8"
            dangerouslySetInnerHTML={{ __html: hero?.description || '<p>Description</p>' }}
          />
          <Link
            href="/products"
            className="inline-block px-6 py-3 bg-white text-indigo-500 rounded-lg hover:bg-gray-100 transition-colors font-medium"
          >
            View Products
          </Link>
        </div>
      </div>
    </section>
  )
}
