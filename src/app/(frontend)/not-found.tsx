import Link from 'next/link'

export default function NotFound() {
  return (
    <div className="min-h-screen flex items-center justify-center py-16">
      <div className="max-w-2xl mx-auto px-4 text-center">
        <h1 className="text-6xl font-bold mb-4">404</h1>
        <p className="text-xl text-gray-600 mb-8">The page you are looking for does not exist.</p>
        <Link
          href="/"
          className="inline-block px-6 py-3 bg-indigo-500 text-white rounded-lg hover:bg-indigo-600 transition-colors"
        >
          Go to homepage
        </Link>
      </div>
    </div>
  )
}
