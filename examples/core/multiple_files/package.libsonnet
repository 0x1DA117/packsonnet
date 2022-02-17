local packsonnet = import '../../../main.libsonnet';
local package = packsonnet.core.package;

package.new(
  function(config) [
    {
      name: 'foo.json',
      content: {
        some: 'content',
      },
    },
    {
      name: 'bar.json',
      content: {
        more: 'content',
      },
    },
  ]
)
