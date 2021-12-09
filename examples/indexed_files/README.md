# Examples - Indexed Files

This example shows how filenames can be prefixed with a number to preserve the
order of the resources on the file system.

## Usage

### Jsonnet

```bash
$ jsonnet -m . main.jsonnet
```

### Bazel

```bash
$ bazel build //examples/indexed_files:indexed_files
```

## Output

**01_foo.json**

```json
{
   "some": "content"
}
```

**02_bar.json**

```json
{
   "more": "content"
}
```
