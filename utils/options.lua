local opt = vim.opt

vim.g.NvimTreeOverlayTitle = ""

opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.fillchars = {
  eob = " ",
  vert = "▏",
  vertright = "▏",
  vertleft = "▏",
  horizup = "▏",
  verthoriz = "▏",
  horizdown = "▁",
  horiz = "▁",
}
