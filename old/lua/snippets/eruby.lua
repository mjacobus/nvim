local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "tf",
    fmt('<turbo-frame id="{}">\n\t{}\n</turbo-frame>', {
      i(1, "frame_idx"),
      i(0),
    })
  ),
  s(
    "r",
    fmt("<%= {} %>", {
      i(0, "render"),
    })
  ),
}
