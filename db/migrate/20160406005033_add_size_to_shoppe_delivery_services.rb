class AddSizeToShoppeDeliveryServices < ActiveRecord::Migration
  def change
    add_column :shoppe_delivery_services, :size, :string
  end
end
