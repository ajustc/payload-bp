import type { GlobalConfig } from 'payload'

export const Config: GlobalConfig = {
  slug: 'config',
  admin: {
    group: 'Site Configuration',
  },
  fields: [
    {
      name: 'navbarLogo',
      type: 'relationship',
      relationTo: 'media',
    },
    {
      name: 'brandingName',
      type: 'text',
    },
    {
      name: 'homeTitle',
      type: 'text',
    },
    {
      name: 'homeDescription',
      type: 'richText',
    },
    {
      name: 'productsTitle',
      type: 'text',
    },
    {
      name: 'productsDescription',
      type: 'richText',
    },
    {
      name: 'productDetailTitle',
      type: 'text',
    },
    {
      name: 'productDetailDescription',
      type: 'richText',
    },
    {
      name: 'aboutTitle',
      type: 'text',
    },
    {
      name: 'aboutDescription',
      type: 'richText',
    },
    {
      name: 'contactTitle',
      type: 'text',
    },
    {
      name: 'contactDescription',
      type: 'richText',
    },
    {
      name: 'articlesTitle',
      type: 'text',
    },
    {
      name: 'articlesDescription',
      type: 'richText',
    },
    {
      name: 'articleDetailTitle',
      type: 'text',
    },
    {
      name: 'articleDetailDescription',
      type: 'richText',
    },
    {
      name: 'colorHeader',
      type: 'text',
      admin: {
        description: 'Header color (hex)',
      },
    },
    {
      name: 'colorTitle',
      type: 'text',
      admin: {
        description: 'Title color (hex)',
      },
    },
    {
      name: 'colorLabel',
      type: 'text',
      admin: {
        description: 'Label color (hex)',
      },
    },
    {
      name: 'colorDescription',
      type: 'text',
      admin: {
        description: 'Description color (hex)',
      },
    },
  ],
}
