def attribute(inval, &block)
  if inval.is_a?(Hash)
    value = inval.values.first
    mymethod = inval.keys.first
  else
    mymethod = inval
  end
  
  define_method mymethod do
    if block
      value = instance_eval(&block)
    end
    @a ||= value
  end

  define_method("#{mymethod}=") { |value| @a = value }
  define_method("#{mymethod}?") { @a }

end