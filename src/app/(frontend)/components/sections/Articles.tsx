import { getPayload } from 'payload'
import config from '@/payload.config'
import Link from 'next/link'
import ArticleCard from '../ArticleCard'

export default async function Articles() {
  const payload = await getPayload({ config })
  const intro = await payload.findGlobal({ slug: 'introduction' })
  const articles = await payload.find({
    collection: 'articles',
    where: { status: { equals: '1' } },
    limit: 3,
    sort: '-publishedAt',
    depth: 1,
  })

  return (
    <section className="py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2
            className="text-4xl font-bold mb-2"
            dangerouslySetInnerHTML={{ __html: intro?.titleArticles || '<p>Latest Articles</p>' }}
          />
          <p
            className="text-gray-600"
            dangerouslySetInnerHTML={{ __html: intro?.labelArticles || '<p>News & insights</p>' }}
          />
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {articles.docs.map((article: any) => (
            <ArticleCard key={article.id} article={article} />
          ))}
        </div>

        <div className="text-center mt-8">
          <Link
            href="/articles"
            className="inline-block px-6 py-3 border-2 border-indigo-500 text-indigo-500 rounded-lg hover:bg-indigo-500 hover:text-white transition-colors"
          >
            View All Articles
          </Link>
        </div>
      </div>
    </section>
  )
}
