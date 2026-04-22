import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import { getPayload } from 'payload'
import config from '@/payload.config'
import Navbar from './components/Navbar'
import Footer from './components/Footer'
import './styles.css'

const inter = Inter({ subsets: ['latin'] })

export async function generateMetadata(): Promise<Metadata> {
  const payload = await getPayload({ config })
  const siteConfig = await payload.findGlobal({ slug: 'config' })

  return {
    title: siteConfig?.homeTitle || 'Plastic Recycling Company',
    description: siteConfig?.homeDescription || 'Your trusted plastic recycling partner',
    openGraph: {
      title: siteConfig?.homeTitle || 'Plastic Recycling',
      description: siteConfig?.homeDescription || 'Your trusted plastic recycling partner',
    },
  }
}

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const payload = await getPayload({ config })
  const siteConfig = await payload.findGlobal({ slug: 'config' })

  return (
    <html lang="en">
      <body className={inter.className}>
        <Navbar config={siteConfig} />
        <main>{children}</main>
        <Footer config={siteConfig} />
      </body>
    </html>
  )
}
