local resource = import '../resource/main.libsonnet';
local file = import '../file/main.libsonnet';
local conf = import '../config/main.libsonnet';

{
  new(
    resourceFunc,
    sortFunc=resource.defaultSortFunc,
    nameFunc=file.defaultNameFunc,
    contentFunc=file.defaultContentFunc,
    defaultConfig={}
  )::
    function(config={}, packsonnetConfig=conf.packsonnetConfig)
      local pc = conf.packsonnetConfig + packsonnetConfig;

      local sf =
        if std.isFunction(pc.sortFuncOverride)
        then pc.sortFuncOverride
        else sortFunc;

      local nf =
        if std.isFunction(pc.nameFuncOverride)
        then pc.nameFuncOverride
        else nameFunc;

      local resources = sf(resourceFunc(defaultConfig + config));

      {
        [nf(index, resources[index])]: contentFunc(resources[index])
          for index in std.range(0, std.length(resources) - 1)
      },
}
