local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "def",
    fmt("def {}\n\t{}\nend", {
      i(1, "frame_idx"),
      i(0),
    })
  ),
}
