{
  defaultNameFunc(index, resource):: resource.name,
  
  newIndexedNameFunc(format='%02d_%s', start=1)::
    function(index, resource)
      std.format(format, [index + start, resource.name]),

  defaultContentFunc(resource):: resource.content,
}
