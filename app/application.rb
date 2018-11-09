class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    
    if req.path.match(/items/)
      resp.status = 200
      item_display
    else
      resp.write "Route not found"
      resp.status = 404
    end 
    resp.finish
  end 
  
  def item_display
    search_item = req.path.split("/items/").last
      if @@items.include?(search_item)
        item = @@items.find{|i| i.name == search_item}
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
end 
      
      