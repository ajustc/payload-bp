import type { CollectionConfig } from 'payload'

export const ProductRequests: CollectionConfig = {
  slug: 'product-requests',
  admin: {
    useAsTitle: 'fullname',
    defaultColumns: ['fullname', 'email', 'company', 'status', 'createdAt'],
  },
  fields: [
    {
      name: 'fullname',
      type: 'text',
      required: true,
    },
    {
      name: 'email',
      type: 'text',
      required: true,
    },
    {
      name: 'phone',
      type: 'text',
    },
    {
      name: 'plasticType',
      type: 'relationship',
      relationTo: 'plastic-types',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'company',
      type: 'text',
    },
    {
      name: 'qty',
      type: 'number',
      admin: {
        description: 'Quantity',
      },
    },
    {
      name: 'status',
      type: 'select',
      options: [
        {
          label: 'Pending',
          value: 'PENDING',
        },
        {
          label: 'Approved',
          value: 'APPROVED',
        },
        {
          label: 'Rejected',
          value: 'REJECTED',
        },
      ],
      defaultValue: 'PENDING',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'product',
      type: 'relationship',
      relationTo: 'products',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'address',
      type: 'richText',
    },
    {
      name: 'notes',
      type: 'richText',
    },
    {
      name: 'recipient',
      type: 'text',
    },
  ],
  access: {
    create: () => true, // Public form submission
    read: () => true, // Allow admin to view
  },
}
