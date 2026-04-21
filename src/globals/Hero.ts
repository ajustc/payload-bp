import type { GlobalConfig } from 'payload'

export const Hero: GlobalConfig = {
  slug: 'hero',
  admin: {
    group: 'Site Configuration',
  },
  fields: [
    {
      name: 'headline',
      type: 'richText',
    },
    {
      name: 'description',
      type: 'richText',
    },
  ],
}
