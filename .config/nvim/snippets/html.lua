local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

return {
  ls.snippet("!html", fmt([[
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HTML5 Boilerplate</title>
  <link rel="stylesheet" href="styles.css">
</head>

<body>
  <h1>Page Title</h1>
</body>

</html>

]], {}))
}
