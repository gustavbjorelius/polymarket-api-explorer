# Polymarket API Explorer

Week 1 of 12 

## Goal 
- [x] Create venv
- [x] Install requests, pandas
- [x] Fetch 50 active markets from Polymarket public API
- [x] Print market questions + prices 

## What I learned building this

- **Nested data structures** — APIs return dictionaries inside lists inside dictionaries. You navigate them with `data["key"][0]["nested_key"]`
- **Inspecting unknown APIs** — before writing code, use `python -c` to print `type(data)` and `data.keys()` to understand the shape of the response
- **URL structure** — `?` separates the path from query parameters (`/markets?active=true`). `/` means a new path segment. Mixing them up gives 404 or 422 errors
- **HTTP status codes** — 200 means success, 404 means not found, 422 means the server understood but couldn't process the request
- **Debugging with python -c** — run quick one-off Python commands without saving a file, useful for testing API responses
- **Tab vs space indentation** — Python requires consistent indentation. Mixing tabs and spaces causes `TabError`. Fix with `sed -i 's/\t/    /g' file.py`
- **Reading error messages** — the traceback tells you exactly which file, which line, and what went wrong. The `~~~^^^` markers point to the broken part of the line
- **API key names change between endpoints** — the clob API used `tokens[0]["price"]`, the gamma API uses `lastTradePrice`. Always inspect the response first
- **Filtering with continue** — skip items in a loop using `if condition: continue`
- **venv never goes in git** — add `venv/` to `.gitignore` immediately when starting a project
- **git -u flag** — `git push -u origin master` sets the upstream so future pushes only need `git push`
