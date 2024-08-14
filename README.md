# HTTP Status Codes

Add to your Project

```
dub add http-status-codes
```

Usage:

```d
import std.stdio;
import http_status;

void main()
{
    auto status = HttpStatus.notFound;
    writefln("%d - %s", status, status.toString);
}
```
