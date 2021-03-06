# Static Files

Prologue supports serving static files.

## staticFileResponse

You can use `staticFileResponse` to make a static file response.

```nim
proc home(ctx: Context) {.async.} =
  await ctx.staticFileResponse("hello.html", "")
```

## serve static files
You can specify `Settings.staticDirs` attributes to serve multiple
static dirs. `staticDirs` is of `seq[string]` type, it contains all
the dirs of static files which will be checked in every request.

```nim
let
  env = loadPrologueEnv(".env")
  settings = newSettings(staticDirs = [env.get("staticDir")])
```

Or set `staticDirs` directly:

```nim
let settings = newSettings(staticDirs = ["/static", "/templates"])
```
