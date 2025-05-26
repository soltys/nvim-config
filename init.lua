local appName = os.getenv("NVIM_APPNAME")

if appName == "lazyvim" then
    require("config.lazy")
else
    require("svim")
end

if vim.g.neovide then
    require("neovide")
end
