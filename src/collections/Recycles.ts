import type { CollectionConfig } from 'payload'

export const Recycles: CollectionConfig = {
  slug: 'recycles',
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'sorting'],
  },
  fields: [
    {
      name: 'title',
      type: 'richText',
    },
    {
      name: 'description',
      type: 'richText',
    },
    {
      name: 'image',
      type: 'relationship',
      relationTo: 'media',
    },
    {
      name: 'sorting',
      type: 'number',
      defaultValue: 0,
      admin: {
        position: 'sidebar',
      },
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
