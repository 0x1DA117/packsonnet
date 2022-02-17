local core = import '../../core/main.libsonnet';
local file = import '../file/main.libsonnet';

{
  new(
    resourceFunc,
    sortFunc=core.resource.defaultSortFunc,
    nameFunc=file.defaultNameFunc,
    contentFunc=file.defaultContentFunc,
    defaultConfig={}
  )::
    core.package.new(
      resourceFunc,
      sortFunc=sortFunc,
      nameFunc=nameFunc,
      contentFunc=contentFunc,
      defaultConfig=defaultConfig
    )
}
