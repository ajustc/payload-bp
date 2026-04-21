import type { GlobalConfig } from 'payload'

export const Introduction: GlobalConfig = {
  slug: 'introduction',
  admin: {
    group: 'Site Configuration',
  },
  fields: [
    {
      type: 'tabs',
      tabs: [
        {
          label: 'Introduction',
          fields: [
            {
              name: 'titleIntroduction',
              type: 'richText',
            },
            {
              name: 'labelIntroduction',
              type: 'richText',
            },
            {
              name: 'descriptionIntroduction',
              type: 'richText',
            },
          ],
        },
        {
          label: 'About',
          fields: [
            {
              name: 'titleAbout',
              type: 'richText',
            },
            {
              name: 'labelAbout',
              type: 'richText',
            },
            {
              name: 'descriptionAbout',
              type: 'richText',
            },
          ],
        },
        {
          label: 'Products',
          fields: [
            {
              name: 'titleProducts',
              type: 'richText',
            },
            {
              name: 'labelProducts',
              type: 'richText',
            },
            {
              name: 'descriptionProducts',
              type: 'richText',
            },
          ],
        },
        {
          label: 'Product Category',
          fields: [
            {
              name: 'titleProductCategory',
              type: 'richText',
            },
            {
              name: 'labelProductCategory',
              type: 'richText',
            },
            {
              name: 'descriptionProductCategory',
              type: 'richText',
            },
          ],
        },
        {
          label: 'Customers',
          fields: [
            {
              name: 'titleCustomers',
              type: 'richText',
            },
            {
              name: 'labelCustomers',
              type: 'richText',
            },
            {
              name: 'descriptionCustomers',
              type: 'richText',
            },
          ],
        },
        {
          label: 'Articles',
          fields: [
            {
              name: 'titleArticles',
              type: 'richText',
            },
            {
              name: 'labelArticles',
              type: 'richText',
            },
            {
              name: 'descriptionArticles',
              type: 'richText',
            },
          ],
        },
        {
          label: 'Recycles',
          fields: [
            {
              name: 'titleRecycles',
              type: 'richText',
            },
            {
              name: 'labelRecycles',
              type: 'richText',
            },
            {
              name: 'descriptionRecycles',
              type: 'richText',
            },
          ],
        },
        {
          label: 'Services',
          fields: [
            {
              name: 'titleServices',
              type: 'richText',
            },
            {
              name: 'labelServices',
              type: 'richText',
            },
            {
              name: 'descriptionServices',
              type: 'richText',
            },
          ],
        },
      ],
    },
  ],
}
