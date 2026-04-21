import { NextResponse } from 'next/server'
import { getPayload } from 'payload'
import config from '@/payload.config'

export async function GET() {
  const payload = await getPayload({ config })
  const products = await payload.find({
    collection: 'products',
    depth: 1,
    sort: 'bestSeller',
  })
  return NextResponse.json(products)
}
