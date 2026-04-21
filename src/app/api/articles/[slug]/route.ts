import { NextResponse } from 'next/server'
import { getPayload } from 'payload'
import config from '@/payload.config'

export async function GET(req: Request, { params }: { params: { slug: string } }) {
  const payload = await getPayload({ config })
  const articles = await payload.find({
    collection: 'articles',
    where: { slug: { equals: params.slug } },
    depth: 2,
  })
  if (!articles.docs[0]) return NextResponse.json({ error: 'Not found' }, { status: 404 })
  return NextResponse.json(articles.docs[0])
}
