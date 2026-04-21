import type { CollectionConfig } from 'payload'

export const Articles: CollectionConfig = {
  slug: 'articles',
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'category', 'status', 'publishedAt'],
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
      name: 'subtitle',
      type: 'text',
    },
    {
      name: 'content',
      type: 'richText',
    },
    {
      name: 'teaser',
      type: 'text',
      admin: {
        description: 'Short summary for article cards',
      },
    },
    {
      name: 'keyword',
      type: 'text',
    },
    {
      name: 'category',
      type: 'relationship',
      relationTo: 'article-categories',
      required: true,
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'photoPath',
      type: 'relationship',
      relationTo: 'media',
      admin: {
        description: 'Main article image',
      },
    },
    {
      name: 'photoCaption',
      type: 'text',
    },
    {
      name: 'author',
      type: 'relationship',
      relationTo: 'users',
      admin: {
        position: 'sidebar',
      },
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
      name: 'status',
      type: 'select',
      options: [
        {
          label: 'Draft',
          value: '0',
        },
        {
          label: 'Published',
          value: '1',
        },
      ],
      defaultValue: '0',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'publishedAt',
      type: 'date',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'tags',
      type: 'relationship',
      relationTo: 'tags',
      hasMany: true,
    },
    {
      name: 'deletedAt',
      type: 'date',
      admin: {
        hidden: true,
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
