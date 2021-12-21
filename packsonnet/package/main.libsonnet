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
        if std.isFunction(pc.sortFuncOverride) then
          pc.sortFuncOverride
        else if std.isFunction(sortFunc) then
          sortFunc
        else
          error 'sortFunc must be a function';

      local nf =
        if std.isFunction(pc.nameFuncOverride) then
          pc.nameFuncOverride
        else if std.isFunction(nameFunc) then
          nameFunc
        else
          error 'nameFunc must be a function';

      local resources = sf(resourceFunc(defaultConfig + config));

      {
        [nf(index, resources[index])]: contentFunc(resources[index])
          for index in std.range(0, std.length(resources) - 1)
      },
}
