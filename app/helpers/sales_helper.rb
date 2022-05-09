module SalesHelper
  def active_sale?
    Sale.active
  end
  # def sale
  #   s = Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  # end
end