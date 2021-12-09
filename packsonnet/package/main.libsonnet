local file = import '../file/main.libsonnet';

{
  new(
    resourceFunc,
    nameFunc=file.defaultNameFunc,
    contentFunc=file.defaultContentFunc,
    defaultConfig={}
  )::
    function(config={})
      local resources = resourceFunc(defaultConfig + config);

      {
        [nameFunc(index, resources[index])]: contentFunc(resources[index])
          for index in std.range(0, std.length(resources) - 1)
      },
}
