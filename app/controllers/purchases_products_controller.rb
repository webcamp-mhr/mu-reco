class PurchasesProductsController < ApplicationController



	def create
    params[:cart_list].each do | di1,di2 |
      # チェックボックスにチェックがついている場合
      if di2 == "1"
        # DBのtitleカラムにタイトルを格納し保存
        @purchases_productse = PurchasesProducts.new(title:di1)
        @purchases_products.save
      end
    end
   if @purchases_products.save
    redirect_to products_path
   end
	end




end
