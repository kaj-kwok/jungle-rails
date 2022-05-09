class Sale < ApplicationRecord

  # boolean if sale is currently active 
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  # boolean if sale is completed, end date is in the past
  def finished?
    ends_on < Date.current
  end

  # boolean if a sale is upcoming, end date is in future and not active currently
  def upcoming?
    ends_on > Date.current && starts_on > Date.current
  end

end
