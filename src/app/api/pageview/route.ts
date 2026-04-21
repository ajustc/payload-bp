import { NextResponse } from 'next/server'
import { getPayload } from 'payload'
import config from '@/payload.config'

export async function POST(req: Request) {
  const { type, id } = await req.json()

  if (!type || !id) {
    return NextResponse.json({ error: 'Missing type or id' }, { status: 400 })
  }

  const payload = await getPayload({ config })

  if (type === 'article') {
    await payload.update({
      collection: 'articles',
      id,
      data: { pageview: { increment: 1 } },
    })
  } else if (type === 'product') {
    await payload.update({
      collection: 'products',
      id,
      data: { pageview: { increment: 1 } },
    })
  } else {
    return NextResponse.json({ error: 'Invalid type' }, { status: 400 })
  }

  return NextResponse.json({ success: true })
}
