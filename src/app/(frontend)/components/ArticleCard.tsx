import Link from 'next/link'

interface ArticleCardProps {
  article: any
}

export default function ArticleCard({ article }: ArticleCardProps) {
  return (
    <div className="border border-gray-200 rounded-lg overflow-hidden transition-transform duration-200 hover:-translate-y-1 hover:shadow-lg">
      <Link href={`/articles/${article.slug}`} className="block text-inherit">
        {article.photoPath && (
          <img
            src={article.photoPath.url}
            alt={article.photoCaption || article.title}
            className="w-full h-48 object-cover"
          />
        )}
        <div className="p-6">
          <h3 className="text-xl font-bold mb-2">{article.title}</h3>
          {article.teaser && <p className="text-gray-600 text-sm line-clamp-3 mb-4">{article.teaser}</p>}
          <span className="text-gray-500 text-sm">
            {article.publishedAt && new Date(article.publishedAt).toLocaleDateString()}
          </span>
        </div>
      </Link>
    </div>
  )
}
