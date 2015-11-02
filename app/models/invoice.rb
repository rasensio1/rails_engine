class Invoice < ActiveRecord::Base
  belongs_to :customer_id
end
