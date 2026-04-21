import type { CollectionConfig } from 'payload'

export const Products: CollectionConfig = {
  slug: 'products',
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'category', 'bestSeller', 'pageview'],
  },
  fields: [
    {
      name: 'title',
      type: 'text',
      required: true,
    },
    {
      name: 'slug',
      type: 'text',
      unique: true,
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'description',
      type: 'richText',
    },
    {
      name: 'category',
      type: 'relationship',
      relationTo: 'product-categories',
      required: true,
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'suitable',
      type: 'text',
      admin: {
        description: 'Suitable applications',
      },
    },
    {
      name: 'mfi',
      type: 'text',
      admin: {
        description: 'Melt Flow Index',
      },
    },
    {
      name: 'photo',
      type: 'array',
      fields: [
        {
          name: 'image',
          type: 'relationship',
          relationTo: 'media',
          required: true,
        },
      ],
    },
    {
      name: 'pageview',
      type: 'number',
      defaultValue: 0,
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'bestSeller',
      type: 'checkbox',
      defaultValue: false,
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'color',
      type: 'text',
    },
    {
      name: 'afterApplication',
      type: 'richText',
    },
    {
      name: 'afterApplicationPhotos',
      type: 'array',
      fields: [
        {
          name: 'image',
          type: 'relationship',
          relationTo: 'media',
          required: true,
        },
      ],
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
