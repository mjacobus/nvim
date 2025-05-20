return {
  "mattn/emmet-vim",
  init = function()
    vim.g.user_emmet_settings = {
      eruby = {
        extends = "html",
        snippets = {
          ["r"] = "<%= $0 %>",
          ["rc"] = "<%= render $0 %>",
          ["rp"] = '<%= render partial: "$0" %>',
          ["jw"] = '<a href="https://www.jw.org/">JW.ORG</a>',
          ["turbo-frame"] = '<turbo-frame id="$1">\n\t$0\n</turbo-frame>',
          ["turbo-stream"] = '<turbo-stream action="$1" target="$2">\n\t<template>\n\t\t$0\n\t</template>\n</turbo-stream>',
        },
      },
    }
  end,
}
