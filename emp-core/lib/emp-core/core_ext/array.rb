class Array
  def to_xml
    map {|e| e.to_xml}.join
  end
end