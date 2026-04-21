import type { CollectionConfig } from 'payload'

export const Customers: CollectionConfig = {
  slug: 'customers',
  admin: {
    useAsTitle: 'company',
    defaultColumns: ['company', 'email', 'phone', 'pic'],
  },
  fields: [
    {
      name: 'company',
      type: 'text',
      required: true,
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
      name: 'pic',
      type: 'text',
      admin: {
        description: 'Person In Charge',
      },
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
