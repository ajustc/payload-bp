import { getPayload } from 'payload'
import config from '@/payload.config'
import ProductCard from '../components/ProductCard'

export default async function ProductsPage() {
  const payload = await getPayload({ config })
  const intro = await payload.findGlobal({ slug: 'introduction' })
  const products = await payload.find({
    collection: 'products',
    depth: 1,
  })

  return (
    <div className="py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h1
            className="text-5xl font-bold mb-4"
            dangerouslySetInnerHTML={{ __html: intro?.titleProducts || '<p>Our Products</p>' }}
          />
          <p
            className="text-gray-600"
            dangerouslySetInnerHTML={{ __html: intro?.descriptionProducts || '<p>Quality materials</p>' }}
          />
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {products.docs.map((product: any) => (
            <ProductCard key={product.id} product={product} />
          ))}
        </div>
      </div>
    </div>
  )
}
