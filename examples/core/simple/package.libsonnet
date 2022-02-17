local packsonnet = import '../../../main.libsonnet';
local package = packsonnet.core.package;

package.new(
  function(config) [
    {
      name: 'foo.json',
      content: {
        bar: 'baz',
      },
    },
  ]
)
