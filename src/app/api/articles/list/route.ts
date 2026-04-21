import { NextResponse } from 'next/server'
import { getPayload } from 'payload'
import config from '@/payload.config'

export async function GET() {
  const payload = await getPayload({ config })
  const articles = await payload.find({
    collection: 'articles',
    depth: 1,
    where: { status: { equals: '1' } },
    sort: '-publishedAt',
  })
  return NextResponse.json(articles)
}
