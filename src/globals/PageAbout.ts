import type { GlobalConfig } from 'payload'

export const PageAbout: GlobalConfig = {
  slug: 'page-about',
  admin: {
    group: 'Pages',
  },
  fields: [
    {
      name: 'vision',
      type: 'richText',
    },
    {
      name: 'mission',
      type: 'richText',
    },
    {
      name: 'photo',
      type: 'relationship',
      relationTo: 'media',
    },
    {
      name: 'description',
      type: 'richText',
    },
    {
      name: 'path',
      type: 'text',
      admin: {
        hidden: true,
      },
    },
  ],
}
