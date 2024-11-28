class Product < ApplicationRecord
  has_neighbors :embedding
  after_create :set_embedding

  PRODUCT_CATEGORIES = ["clothing", "furniture", "accessory"]
  validates :category, presence: true, inclusion: { in: PRODUCT_CATEGORIES }
  validates :name, :description, :price, :material, :available_quantity, :size, presence: true

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
