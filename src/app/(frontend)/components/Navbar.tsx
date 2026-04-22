'use client'

import Link from 'next/link'
import { useState } from 'react'

interface NavbarProps {
  config: {
    brandingName?: string
    navbarLogo?: { url: string }
  }
}

export default function Navbar({ config }: NavbarProps) {
  const [mobileOpen, setMobileOpen] = useState(false)

  return (
    <nav className="bg-white shadow-md sticky top-0 z-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          <Link href="/" className="flex items-center gap-4 font-bold text-xl">
            {config.navbarLogo && (
              <img
                src={config.navbarLogo.url}
                alt={config.brandingName || 'Logo'}
                className="h-10"
              />
            )}
            {config.brandingName && <span>{config.brandingName}</span>}
          </Link>

          <button
            className="md:hidden flex flex-col gap-1 bg-none border-none cursor-pointer"
            onClick={() => setMobileOpen(!mobileOpen)}
            aria-label="Toggle navigation"
          >
            <span className="w-6 h-0.5 bg-gray-800"></span>
            <span className="w-6 h-0.5 bg-gray-800"></span>
            <span className="w-6 h-0.5 bg-gray-800"></span>
          </button>

          <div className={`hidden md:flex gap-8`}>
            <Link href="/" className="text-gray-700 hover:text-gray-900 transition">Home</Link>
            <Link href="/about" className="text-gray-700 hover:text-gray-900 transition">About</Link>
            <Link href="/products" className="text-gray-700 hover:text-gray-900 transition">Products</Link>
            <Link href="/articles" className="text-gray-700 hover:text-gray-900 transition">Articles</Link>
            <Link href="/contact" className="text-gray-700 hover:text-gray-900 transition">Contact</Link>
          </div>

          {mobileOpen && (
            <div className="md:hidden absolute top-16 left-0 right-0 bg-white shadow-md p-4">
              <div className="flex flex-col gap-4">
                <Link href="/" onClick={() => setMobileOpen(false)} className="text-gray-700">Home</Link>
                <Link href="/about" onClick={() => setMobileOpen(false)} className="text-gray-700">About</Link>
                <Link href="/products" onClick={() => setMobileOpen(false)} className="text-gray-700">Products</Link>
                <Link href="/articles" onClick={() => setMobileOpen(false)} className="text-gray-700">Articles</Link>
                <Link href="/contact" onClick={() => setMobileOpen(false)} className="text-gray-700">Contact</Link>
              </div>
            </div>
          )}
        </div>
      </div>
    </nav>
  )
}
