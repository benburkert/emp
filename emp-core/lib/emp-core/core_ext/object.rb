class Object
  def args_and_opts(*args)
    options = Hash === args.last ? args.pop : {}
    return args, options
  end
end