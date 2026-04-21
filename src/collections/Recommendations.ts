import type { CollectionConfig } from 'payload'

export const Recommendations: CollectionConfig = {
  slug: 'recommendations',
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['article', 'product', 'recommendationArticle', 'recommendationProduct'],
  },
  fields: [
    {
      name: 'article',
      type: 'relationship',
      relationTo: 'articles',
      admin: {
        condition: (data) => !data.product,
      },
    },
    {
      name: 'product',
      type: 'relationship',
      relationTo: 'products',
      admin: {
        condition: (data) => !data.article,
      },
    },
    {
      name: 'recommendationArticle',
      type: 'relationship',
      relationTo: 'articles',
      admin: {
        condition: (data) => !data.recommendationProduct,
      },
    },
    {
      name: 'recommendationProduct',
      type: 'relationship',
      relationTo: 'products',
      admin: {
        condition: (data) => !data.recommendationArticle,
      },
    },
    {
      name: 'sorting',
      type: 'number',
      defaultValue: 0,
      admin: {
        position: 'sidebar',
      },
    },
  ],
  access: {
    read: () => true,
  },
}
