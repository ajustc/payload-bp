#!/bin/bash

echo "Testing Frontend Pages..."
echo "========================="

# Test main pages
pages=("" "about" "products" "articles" "contact")

for page in "${pages[@]}"; do
  url="http://localhost:3000/$page"
  status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  name="${page:-/}"
  if [ "$status" = "200" ]; then
    echo "✅ $name - $status"
  else
    echo "❌ $name - $status"
  fi
done

echo ""
echo "Testing Admin Panel..."
admin_status=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:3000/admin")
if [ "$admin_status" = "200" ]; then
  echo "✅ /admin - $admin_status"
else
  echo "❌ /admin - $admin_status"
fi

echo ""
echo "========================="
echo "Test Complete!"
