import { postgresAdapter } from '@payloadcms/db-postgres'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
import path from 'path'
import { buildConfig } from 'payload'
import { fileURLToPath } from 'url'
import sharp from 'sharp'

import { Users } from './collections/Users'
import { Media } from './collections/Media'

import { ArticleCategories } from './collections/ArticleCategories'
import { ProductCategories } from './collections/ProductCategories'
import { Tags } from './collections/Tags'
import { Articles } from './collections/Articles'
import { Products } from './collections/Products'
import { Customers } from './collections/Customers'
import { Recycles } from './collections/Recycles'
import { PlasticTypes } from './collections/PlasticTypes'
import { ProductRequests } from './collections/ProductRequests'

import { Config } from './globals/Config'
import { Hero } from './globals/Hero'
import { Introduction } from './globals/Introduction'
import { PageAbout } from './globals/PageAbout'
import { PageContact } from './globals/PageContact'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
  admin: {
    user: Users.slug,
    importMap: {
      baseDir: path.resolve(dirname),
    },
  },
  collections: [
    Users,
    Media,
    ArticleCategories,
    ProductCategories,
    Tags,
    Articles,
    Products,
    Customers,
    Recycles,
    PlasticTypes,
    ProductRequests,
  ],
  globals: [
    Config,
    Hero,
    Introduction,
    PageAbout,
    PageContact,
  ],
  editor: lexicalEditor(),
  secret: process.env.PAYLOAD_SECRET || '',
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  db: postgresAdapter({
    pool: {
      connectionString: process.env.DATABASE_URL || '',
    },
  }),
  sharp,
  plugins: [],
})
