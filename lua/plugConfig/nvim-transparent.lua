require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = {
    "Folded", "TabLineFill", "cursorline"
  },
  exclude = {}, -- table: groups you don't want to clear
})
