import { getPayload } from 'payload'
import config from '@/payload.config'

export default async function AboutPage() {
  const payload = await getPayload({ config })
  const [pageAbout, siteConfig] = await Promise.all([
    payload.findGlobal({ slug: 'page-about' }),
    payload.findGlobal({ slug: 'config' }),
  ])

  return (
    <div className="py-16">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h1 className="text-5xl font-bold mb-4">About Us</h1>
          {siteConfig?.aboutTitle && <p className="text-gray-600">{siteConfig.aboutTitle}</p>}
        </div>

        <div className="space-y-12">
          {pageAbout.vision && (
            <div className="prose prose-lg max-w-none">
              <h2 className="text-3xl font-bold mb-4">Our Vision</h2>
              <div dangerouslySetInnerHTML={{ __html: pageAbout.vision }} />
            </div>
          )}

          {pageAbout.mission && (
            <div className="prose prose-lg max-w-none">
              <h2 className="text-3xl font-bold mb-4">Our Mission</h2>
              <div dangerouslySetInnerHTML={{ __html: pageAbout.mission }} />
            </div>
          )}

          {pageAbout.description && (
            <div className="prose prose-lg max-w-none">
              <h2 className="text-3xl font-bold mb-4">About Us</h2>
              <div dangerouslySetInnerHTML={{ __html: pageAbout.description }} />
            </div>
          )}

          {pageAbout.photo && (
            <div className="mt-8">
              <img src={pageAbout.photo.url} alt="About us" className="w-full rounded-lg" />
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
