class AnalyseFaceDetail < ApplicationRecord
  belongs_to :photo
  has_one :post
end
