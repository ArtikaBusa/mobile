json.extract! product, :id, :description, :available, :release_year, :brand_id, :created_at, :updated_at
json.url product_url(product, format: :json)
