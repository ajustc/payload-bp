import { getPayload } from 'payload'
import config from '@/payload.config'
import { notFound } from 'next/navigation'
import ArticleCard from '../../components/ArticleCard'

interface PageProps {
  params: { slug: string }
}

export async function generateMetadata({ params }: PageProps) {
  const payload = await getPayload({ config })
  const siteConfig = await payload.findGlobal({ slug: 'config' })

  const articles = await payload.find({
    collection: 'articles',
    where: { slug: { equals: params.slug } },
  })

  if (!articles.docs[0]) return {}

  return {
    title: articles.docs[0].title,
    description: articles.docs[0].teaser || siteConfig?.articleDetailDescription,
  }
}

export default async function ArticleDetailPage({ params }: PageProps) {
  const payload = await getPayload({ config })

  const [articles, recommendations] = await Promise.all([
    payload.find({
      collection: 'articles',
      where: { slug: { equals: params.slug } },
      depth: 2,
    }),
    payload.find({
      collection: 'recommendations',
      where: { article: { equals: params.slug } },
      depth: 2,
    }),
  ])

  const article = articles.docs[0]
  if (!article) return notFound()

  // Increment pageview
  await fetch(`${process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'}/api/pageview`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ type: 'article', id: article.id }),
  }).catch(() => {})

  const relatedArticles = recommendations.docs.filter((r: any) => r.recommendationArticle)
  const relatedProducts = recommendations.docs.filter((r: any) => r.recommendationProduct)

  return (
    <div className="py-16">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-8">
          <h1 className="text-5xl font-bold mb-4">{article.title}</h1>
          {article.category && (
            <span className="inline-block px-4 py-2 bg-indigo-500 text-white rounded-full text-sm">
              {article.category.name}
            </span>
          )}
        </div>

        <div className="text-center text-gray-600 mb-8">
          {article.publishedAt && (
            <span>Published: {new Date(article.publishedAt).toLocaleDateString()}</span>
          )}
          {article.author && (
            <span className="ml-4">By: {article.author.name}</span>
          )}
        </div>

        {article.photoPath && (
          <div className="mb-8">
            <img
              src={article.photoPath.url}
              alt={article.photoCaption || article.title}
              className="w-full rounded-lg"
            />
            {article.photoCaption && (
              <p className="text-center text-gray-600 text-sm mt-2">{article.photoCaption}</p>
            )}
          </div>
        )}

        <div className="prose prose-lg max-w-none mb-8">
          <div dangerouslySetInnerHTML={{ __html: article.content }} />
        </div>

        {article.tags && article.tags.length > 0 && (
          <div className="mb-12">
            <h4 className="font-semibold mb-4">Tags:</h4>
            <div className="flex gap-2 flex-wrap">
              {article.tags.map((tag: any) => (
                <span
                  key={tag.id}
                  className="px-3 py-1 bg-gray-200 rounded-full text-sm"
                >
                  {tag.name}
                </span>
              ))}
            </div>
          </div>
        )}

        {(relatedArticles.length > 0 || relatedProducts.length > 0) && (
          <div className="mt-16">
            <h2 className="text-3xl font-bold mb-8">Related</h2>

            {relatedArticles.length > 0 && (
              <div className="mb-12">
                <h3 className="text-2xl font-semibold mb-6">Related Articles</h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                  {relatedArticles.map((rec: any) => (
                    <ArticleCard
                      key={rec.id}
                      article={rec.recommendationArticle}
                    />
                  ))}
                </div>
              </div>
            )}

            {relatedProducts.length > 0 && (
              <div className="mb-12">
                <h3 className="text-2xl font-semibold mb-6">Related Products</h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                  {relatedProducts.map((rec: any) => (
                    <div
                      key={rec.id}
                      className="border border-gray-200 rounded-lg overflow-hidden hover:shadow-lg transition"
                    >
                      <a href={`/products/${rec.recommendationProduct.slug}`} className="block">
                        {rec.recommendationProduct.photo?.[0]?.image && (
                          <img
                            src={rec.recommendationProduct.photo[0].image.url}
                            alt={rec.recommendationProduct.title}
                            className="w-full h-48 object-cover"
                          />
                        )}
                        <div className="p-4">
                          <h4 className="font-bold">{rec.recommendationProduct.title}</h4>
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
