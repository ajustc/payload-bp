import { getPayload } from 'payload'
import config from '@/payload.config'
import ArticleCard from '../components/ArticleCard'

export default async function ArticlesPage() {
  const payload = await getPayload({ config })
  const intro = await payload.findGlobal({ slug: 'introduction' })
  const articles = await payload.find({
    collection: 'articles',
    where: { status: { equals: '1' } },
    depth: 1,
    sort: '-publishedAt',
  })

  return (
    <div className="py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h1
            className="text-5xl font-bold mb-4"
            dangerouslySetInnerHTML={{ __html: intro?.titleArticles || '<p>Articles</p>' }}
          />
          <p
            className="text-gray-600"
            dangerouslySetInnerHTML={{ __html: intro?.descriptionArticles || '<p>Latest news and insights</p>' }}
          />
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {articles.docs.map((article: any) => (
            <ArticleCard key={article.id} article={article} />
          ))}
        </div>
      </div>
    </div>
  )
}
