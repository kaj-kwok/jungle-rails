class Sale < ApplicationRecord

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    ends_on > Date.current
  end
  
end
