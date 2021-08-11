class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |method_name|
      define_method(method_name) do
        instance_variable_get("@#{method_name}")
      end



      define_method("#{method_name}=") do
        |ele|
        instance_variable_set("@#{method_name}",ele)
      end
    end
  end
end

# define_method(METHOD_NAME HERE) do 
#   |PARAMETERS OF METHOD NAME|



# end


# def METHOD_NAME(PARAMATERS)



# end