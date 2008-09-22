class Invoice
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :title,  String, :lazy => false
  property :desc,  String, :lazy => false
  
  
end
