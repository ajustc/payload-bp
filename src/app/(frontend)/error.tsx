'use client'

import { useEffect } from 'react'

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    console.error(error)
  }, [error])

  return (
    <div className="min-h-screen flex items-center justify-center py-16">
      <div className="max-w-2xl mx-auto px-4 text-center">
        <h1 className="text-6xl font-bold mb-4">Something went wrong</h1>
        <p className="text-xl text-gray-600 mb-8">
          We apologize for the inconvenience. An error has occurred.
        </p>
        <div className="flex gap-4 justify-center">
          <button
            onClick={reset}
            className="px-6 py-3 bg-indigo-500 text-white rounded-lg hover:bg-indigo-600 transition-colors"
          >
            Try again
          </button>
          <a
            href="/"
            className="px-6 py-3 border-2 border-indigo-500 text-indigo-500 rounded-lg hover:bg-indigo-500 hover:text-white transition-colors"
          >
            Go to homepage
          </a>
        </div>
      </div>
    </div>
  )
}
