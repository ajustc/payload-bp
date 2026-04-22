import { getPayload } from 'payload'
import config from '@/payload.config'

export default async function Customers() {
  const payload = await getPayload({ config })
  const intro = await payload.findGlobal({ slug: 'introduction' })
  const customers = await payload.find({
    collection: 'customers',
    limit: 10,
  })

  return (
    <section className="py-16 bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2
            className="text-4xl font-bold mb-2"
            dangerouslySetInnerHTML={{ __html: intro?.titleCustomers || '<p>Our Customers</p>' }}
          />
          <p
            className="text-gray-600"
            dangerouslySetInnerHTML={{ __html: intro?.labelCustomers || '<p>Trusted by industry leaders</p>' }}
          />
        </div>

        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-6">
          {customers.docs.map((customer: any) => (
            <div key={customer.id} className="text-center p-4 border border-gray-200 rounded-lg bg-white">
              {customer.photo && (
                <img
                  src={customer.photo.url}
                  alt={customer.company}
                  className="max-w-[120px] h-auto mx-auto mb-2"
                />
              )}
              {customer.pic && <span className="text-sm text-gray-600">{customer.pic}</span>}
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
