local appName = os.getenv("NVIM_APPNAME")

if appName == "nvim" then
    require("config.lazy")
elseif appName == "svim" then
    require("svim")
end

if vim.g.neovide then
    require("neovide")
end
