import type { GlobalConfig } from 'payload'

export const PageContact: GlobalConfig = {
  slug: 'page-contact',
  admin: {
    group: 'Pages',
  },
  fields: [
    {
      name: 'company',
      type: 'text',
    },
    {
      name: 'email',
      type: 'text',
    },
    {
      name: 'phone',
      type: 'text',
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
      name: 'address',
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
