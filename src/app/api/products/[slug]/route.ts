import { NextResponse } from 'next/server'
import { getPayload } from 'payload'
import config from '@/payload.config'

export async function GET(req: Request, { params }: { params: { slug: string } }) {
  const payload = await getPayload({ config })
  const products = await payload.find({
    collection: 'products',
    where: { slug: { equals: params.slug } },
    depth: 2,
  })
  if (!products.docs[0]) return NextResponse.json({ error: 'Not found' }, { status: 404 })
  return NextResponse.json(products.docs[0])
}
