# Examples - Multiple Files

This example shows the output of more than one file.

## Usage

### Jsonnet

```bash
$ jsonnet -m . main.jsonnet
```

### Bazel

```bash
$ bazel build //examples/multiple_files:multiple_files
```

## Output

**foo.json**

```json
{
   "some": "content"
}
```

**bar.json**

```json
{
   "more": "content"
}
```
