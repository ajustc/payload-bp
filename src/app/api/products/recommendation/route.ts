import { NextResponse } from 'next/server'
import { getPayload } from 'payload'
import config from '@/payload.config'

export async function GET(req: Request) {
  const { searchParams } = new URL(req.url)
  const productId = searchParams.get('id')

  const payload = await getPayload({ config })
  const recommendations = await payload.find({
    collection: 'recommendations',
    where: { product: { equals: productId } },
    depth: 2,
  })
  return NextResponse.json(recommendations)
}
