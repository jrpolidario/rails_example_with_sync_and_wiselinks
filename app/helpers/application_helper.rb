module ApplicationHelper
  def generate_dom_unique_id
    return (Time.now.to_f*1000000).to_i.to_s(16)
  end
end
