module ApplicationHelper
  
  def to_priority_string(number)
  	if number == 1
  		return "<strong > Low</strong>"
  	elsif number == 2
  		return "<strong > Normal</strong>"
  	else
  		return "<strong > High</strong>"
  	end
  end

end
