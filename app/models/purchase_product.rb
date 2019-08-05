class PurchaseProduct < ApplicationRecord

  #optional: trueは画像が設定されてなくてもよい時のために記載している
  belongs_to :purchase_history , optional: true
  attachment :jacket_image
end
