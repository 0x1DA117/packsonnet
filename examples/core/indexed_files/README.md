This example shows how filenames can be prefixed with a number to preserve the
order of the resources on the file system.

## Usage

```bash
$ jsonnet -m . main.jsonnet
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
