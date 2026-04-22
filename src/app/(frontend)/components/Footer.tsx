interface FooterProps {
  config: {
    brandingName?: string
    homeDescription?: string
    contactEmail?: string
    contactPhone?: string
  }
}

export default function Footer({ config }: FooterProps) {
  return (
    <footer className="bg-gray-900 text-white py-8 mt-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div>
            <h3 className="text-xl font-bold mb-4">{config.brandingName || 'Company'}</h3>
            <p className="text-gray-400">{config.homeDescription || 'Your trusted partner in plastic recycling.'}</p>
          </div>

          <div>
            <h4 className="text-lg font-semibold mb-4">Quick Links</h4>
            <ul className="space-y-2">
              <li><a href="/" className="text-gray-400 hover:text-white transition">Home</a></li>
              <li><a href="/about" className="text-gray-400 hover:text-white transition">About</a></li>
              <li><a href="/products" className="text-gray-400 hover:text-white transition">Products</a></li>
              <li><a href="/articles" className="text-gray-400 hover:text-white transition">Articles</a></li>
              <li><a href="/contact" className="text-gray-400 hover:text-white transition">Contact</a></li>
            </ul>
          </div>

          <div>
            <h4 className="text-lg font-semibold mb-4">Contact</h4>
            <p className="text-gray-400">Email: {config.contactEmail || 'info@example.com'}</p>
            <p className="text-gray-400">Phone: {config.contactPhone || '+62 xxx xxxx'}</p>
          </div>
        </div>

        <div className="border-t border-gray-800 mt-8 pt-8 text-center">
          <p className="text-gray-400">&copy; {new Date().getFullYear()} {config.brandingName || 'Company'}. All rights reserved.</p>
        </div>
      </div>
    </footer>
  )
}
