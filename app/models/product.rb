require "open-uri"

class Product < ApplicationRecord
  has_neighbors :embedding
  after_create :set_embedding
  has_one_attached :photo

  PRODUCT_CATEGORIES = ["clothing", "furniture", "accessory"]
  validates :category, presence: true, inclusion: { in: PRODUCT_CATEGORIES }
  validates :name, :description, :price, :material, :available_quantity, :size, presence: true

  def set_photo
    puts "Generating image..."
    client = OpenAI::Client.new
    response = client.images.generate(parameters: {
      prompt: "Image for e-commerce website for product: #{name}, description: #{description}, made from #{material}", size: "256x256"
    })

    url = response["data"][0]["url"]
    file = URI.parse(url).open

    # photo.purge if photo.attached?
    photo.attach(io: file, filename: "ai_generated_image.jpg", content_type: "image/png")
    return photo
  end

  private

  def set_embedding
    client = OpenAI::Client.new
    response = client.embeddings(
      parameters: {
        model: "text-embedding-3-small",
        input: "Product name: #{name}, description: #{description}, price: #{price}"
      }
    )
    embedding = response['data'][0]['embedding']
    update(embedding: embedding)
  end
end
