local packsonnet = import '../../../main.libsonnet';
local package = packsonnet.core.package;
local file = packsonnet.core.file;

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
  ],
  nameFunc=file.newIndexedNameFunc()
)
