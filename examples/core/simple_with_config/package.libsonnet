local packsonnet = import '../../../main.libsonnet';
local package = packsonnet.core.package;

package.new(
  function(config) [
    {
      name: 'foo.json',
      content: {
        bar: config.value,
      },
    },
  ],
  defaultConfig={
    value: error 'Please specify a value',
  }
)
