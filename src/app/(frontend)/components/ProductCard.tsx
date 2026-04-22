import Link from 'next/link'

interface ProductCardProps {
  product: any
}

export default function ProductCard({ product }: ProductCardProps) {
  return (
    <div className="border border-gray-200 rounded-lg overflow-hidden transition-transform duration-200 hover:-translate-y-1 hover:shadow-lg">
      <Link href={`/products/${product.slug}`} className="block text-inherit">
        {product.photo && product.photo.length > 0 && (
          <img
            src={product.photo[0].image.url}
            alt={product.title}
            className="w-full h-48 object-cover"
          />
        )}
        <div className="p-6">
          <h3 className="text-xl font-bold mb-2">{product.title}</h3>
          {product.color && <span className="text-gray-600 text-sm">Color: {product.color}</span>}
          {product.bestSeller && (
            <span className="inline-block px-2 py-1 bg-green-500 text-white text-xs rounded ml-2">
              Best Seller
            </span>
          )}
        </div>
      </Link>
    </div>
  )
}
