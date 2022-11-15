local colorscheme = "gruvbox-material"

vim.g.gruvbox_material_background = 'soft'
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)


if not status_ok then
  vim.notify("colorscheme" .. colorscheme .. "is not found!")
  return
end
