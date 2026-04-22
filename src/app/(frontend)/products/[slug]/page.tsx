import { getPayload } from 'payload'
import config from '@/payload.config'
import { notFound } from 'next/navigation'
import ProductCard from '../../components/ProductCard'

interface PageProps {
  params: { slug: string }
}

export async function generateMetadata({ params }: PageProps) {
  const payload = await getPayload({ config })
  const siteConfig = await payload.findGlobal({ slug: 'config' })

  const products = await payload.find({
    collection: 'products',
    where: { slug: { equals: params.slug } },
  })

  if (!products.docs[0]) return {}

  return {
    title: products.docs[0].title,
    description: products.docs[0].description || siteConfig?.productDetailDescription,
  }
}

export default async function ProductDetailPage({ params }: PageProps) {
  const payload = await getPayload({ config })

  const [products, recommendations] = await Promise.all([
    payload.find({
      collection: 'products',
      where: { slug: { equals: params.slug } },
      depth: 2,
    }),
    payload.find({
      collection: 'recommendations',
      where: { product: { equals: params.slug } },
      depth: 2,
    }),
  ])

  const product = products.docs[0]
  if (!product) return notFound()

  // Increment pageview
  await fetch(`${process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'}/api/pageview`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ type: 'product', id: product.id }),
  }).catch(() => {})

  const relatedProducts = recommendations.docs.filter((r: any) => r.recommendationProduct)
  const relatedArticles = recommendations.docs.filter((r: any) => r.recommendationArticle)

  return (
    <div className="py-16">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-8">
          <h1 className="text-5xl font-bold mb-4">{product.title}</h1>
          {product.category && (
            <span className="inline-block px-4 py-2 bg-indigo-500 text-white rounded-full text-sm">
              {product.category.name}
            </span>
          )}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
          {product.photo && product.photo.map((img: any, index: number) => (
            <div key={index} className="rounded-lg overflow-hidden">
              <img src={img.image.url} alt={`${product.title} ${index + 1}`} className="w-full" />
            </div>
          ))}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-12 mb-12">
          <div>
            <h2 className="text-2xl font-bold mb-6">Product Information</h2>

            {product.suitable && (
              <div className="flex justify-between py-3 border-b">
                <span className="font-semibold">Suitable:</span>
                <span>{product.suitable}</span>
              </div>
            )}

            {product.mfi && (
              <div className="flex justify-between py-3 border-b">
                <span className="font-semibold">MFI:</span>
                <span>{product.mfi}</span>
              </div>
            )}

            {product.color && (
              <div className="flex justify-between py-3 border-b">
                <span className="font-semibold">Color:</span>
                <span>{product.color}</span>
              </div>
            )}

            {product.bestSeller && (
              <div className="py-3">
                <span className="inline-block px-3 py-1 bg-green-500 text-white text-sm rounded">
                  Best Seller
                </span>
              </div>
            )}
          </div>

          <div>
            <h2 className="text-2xl font-bold mb-6">Description</h2>
            <div className="prose prose-lg max-w-none" dangerouslySetInnerHTML={{ __html: product.description }} />
          </div>
        </div>

        {product.afterApplication && (
          <div className="mb-12">
            <h2 className="text-2xl font-bold mb-6">After Application</h2>
            <div className="prose prose-lg max-w-none mb-6" dangerouslySetInnerHTML={{ __html: product.afterApplication }} />

            {product.afterApplicationPhotos && product.afterApplicationPhotos.length > 0 && (
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                {product.afterApplicationPhotos.map((img: any, index: number) => (
                  <img
                    key={index}
                    src={img.image.url}
                    alt={`After application ${index + 1}`}
                    className="w-full rounded-lg"
                  />
                ))}
              </div>
            )}
          </div>
        )}

        {(relatedProducts.length > 0 || relatedArticles.length > 0) && (
          <div className="mt-16">
            <h2 className="text-3xl font-bold mb-8">You May Also Like</h2>

            {relatedProducts.length > 0 && (
              <div className="mb-12">
                <h3 className="text-2xl font-semibold mb-6">Related Products</h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                  {relatedProducts.map((rec: any) => (
                    <ProductCard
                      key={rec.id}
                      product={rec.recommendationProduct}
                    />
                  ))}
                </div>
              </div>
            )}

            {relatedArticles.length > 0 && (
              <div className="mb-12">
                <h3 className="text-2xl font-semibold mb-6">Related Articles</h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                  {relatedArticles.map((rec: any) => (
                    <div
                      key={rec.id}
                      className="border border-gray-200 rounded-lg overflow-hidden hover:shadow-lg transition"
                    >
                      <a href={`/articles/${rec.recommendationArticle.slug}`} className="block">
                        {rec.recommendationArticle.photoPath && (
                          <img
                            src={rec.recommendationArticle.photoPath.url}
                            alt={rec.recommendationArticle.title}
                            className="w-full h-48 object-cover"
                          />
                        )}
                        <div className="p-4">
                          <h4 className="font-bold">{rec.recommendationArticle.title}</h4>
                        </div>
                      </a>
                    </div>
                  ))}
                </div>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  )
}
