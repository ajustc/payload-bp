import { NextResponse } from 'next/server'
import { getPayload } from 'payload'
import config from '@/payload.config'

export async function GET(req: Request) {
  const { searchParams } = new URL(req.url)
  const articleId = searchParams.get('id')

  const payload = await getPayload({ config })
  const recommendations = await payload.find({
    collection: 'recommendations',
    where: { article: { equals: articleId } },
    depth: 2,
  })
  return NextResponse.json(recommendations)
}
