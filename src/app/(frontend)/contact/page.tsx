import { getPayload } from 'payload'
import config from '@/payload.config'

export default async function ContactPage() {
  const payload = await getPayload({ config })
  const [pageContact, siteConfig] = await Promise.all([
    payload.findGlobal({ slug: 'page-contact' }),
    payload.findGlobal({ slug: 'config' }),
  ])

  return (
    <div className="py-16">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h1 className="text-5xl font-bold mb-4">Contact Us</h1>
          {siteConfig?.contactTitle && <p className="text-gray-600">{siteConfig.contactTitle}</p>}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
          <div>
            <h2 className="text-2xl font-bold mb-6">Get In Touch</h2>
            <div className="space-y-4">
              {pageContact.company && (
                <div>
                  <span className="font-semibold">Company:</span>
                  <span className="ml-2">{pageContact.company}</span>
                </div>
              )}
              {pageContact.email && (
                <div>
                  <span className="font-semibold">Email:</span>
                  <a href={`mailto:${pageContact.email}`} className="ml-2 text-indigo-500 hover:underline">
                    {pageContact.email}
                  </a>
                </div>
              )}
              {pageContact.phone && (
                <div>
                  <span className="font-semibold">Phone:</span>
                  <span className="ml-2">{pageContact.phone}</span>
                </div>
              )}
              {pageContact.address && (
                <div>
                  <span className="font-semibold">Address:</span>
                  <div className="mt-2" dangerouslySetInnerHTML={{ __html: pageContact.address }} />
                </div>
              )}
            </div>

            {pageContact.description && (
              <div className="mt-8">
                <div dangerouslySetInnerHTML={{ __html: pageContact.description }} />
              </div>
            )}

            {pageContact.photo && (
              <div className="mt-8">
                <img src={pageContact.photo.url} alt="Contact us" className="w-full rounded-lg" />
              </div>
            )}
          </div>

          <div>
            <h2 className="text-2xl font-bold mb-6">Send us a message</h2>
            <form action="/api/product-requests" method="POST" className="space-y-4">
              <div>
                <label htmlFor="fullname" className="block mb-2 font-medium">
                  Full Name *
                </label>
                <input
                  type="text"
                  id="fullname"
                  name="fullname"
                  required
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg"
                />
              </div>

              <div>
                <label htmlFor="email" className="block mb-2 font-medium">
                  Email *
                </label>
                <input
                  type="email"
                  id="email"
                  name="email"
                  required
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg"
                />
              </div>

              <div>
                <label htmlFor="phone" className="block mb-2 font-medium">
                  Phone
                </label>
                <input
                  type="text"
                  id="phone"
                  name="phone"
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg"
                />
              </div>

              <div>
                <label htmlFor="company" className="block mb-2 font-medium">
                  Company
                </label>
                <input
                  type="text"
                  id="company"
                  name="company"
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg"
                />
              </div>

              <div>
                <label htmlFor="message" className="block mb-2 font-medium">
                  Message
                </label>
                <textarea
                  id="message"
                  name="notes"
                  rows={5}
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg"
                ></textarea>
              </div>

              <button
                type="submit"
                className="w-full px-6 py-3 bg-indigo-500 text-white rounded-lg hover:bg-indigo-600 transition-colors font-medium"
              >
                Send Message
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  )
}
