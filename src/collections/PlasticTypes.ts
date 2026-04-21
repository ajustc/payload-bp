import type { CollectionConfig } from 'payload'

export const PlasticTypes: CollectionConfig = {
  slug: 'plastic-types',
  admin: {
    useAsTitle: 'name',
  },
  fields: [
    {
      name: 'name',
      type: 'text',
      required: true,
    },
  ],
}
