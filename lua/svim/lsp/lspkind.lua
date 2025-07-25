-- https://github.com/onsails/lspkind.nvim
-- https://github.com/onsails/lspkind.nvim/blob/master/lua/lspkind/init.lua
local lspkind = {}
local fmt = string.format

local kind_presets = {
    default = {
        -- if you change or add symbol here
        -- replace corresponding line in readme
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
    },
    codicons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    },
}

local kind_order = {
    "Text",
    "Method",
    "Function",
    "Constructor",
    "Field",
    "Variable",
    "Class",
    "Interface",
    "Module",
    "Property",
    "Unit",
    "Value",
    "Enum",
    "Keyword",
    "Snippet",
    "Color",
    "File",
    "Reference",
    "Folder",
    "EnumMember",
    "Constant",
    "Struct",
    "Event",
    "Operator",
    "TypeParameter",
}
local kind_len = 25

local function get_symbol(kind)
    local symbol = lspkind.symbol_map[kind]
    return symbol or ""
end

local modes = {
    ["text"] = function(kind)
        return kind
    end,
    ["text_symbol"] = function(kind)
        local symbol = get_symbol(kind)
        return fmt("%s %s", kind, symbol)
    end,
    ["symbol_text"] = function(kind)
        local symbol = get_symbol(kind)
        return fmt("%s %s", symbol, kind)
    end,
    ["symbol"] = function(kind)
        local symbol = get_symbol(kind)
        return fmt("%s", symbol)
    end,
}

-- default true
-- deprecated
local function opt_with_text(opts)
    return opts == nil or opts["with_text"] == nil or opts["with_text"]
end

-- default 'symbol'
local function opt_mode(opts)
    local mode = "symbol"
    if opt_with_text(opts) and opts ~= nil and opts["mode"] == nil then
        mode = "symbol_text"
    elseif opts ~= nil and opts["mode"] ~= nil then
        mode = opts["mode"]
    end
    return mode
end

-- default 'default'
local function opt_preset(opts)
    local preset
    if opts == nil or opts["preset"] == nil then
        preset = "default"
    else
        preset = opts["preset"]
    end
    return preset
end

function lspkind.init(opts)
    if opts ~= nil and opts["with_text"] ~= nil then
        vim.api.nvim_command("echoerr 'DEPRECATED replaced by mode option.'")
    end
    local preset = opt_preset(opts)

    local symbol_map = kind_presets[preset]
    lspkind.symbol_map = (opts and opts["symbol_map"] and vim.tbl_extend("force", symbol_map, opts["symbol_map"]))
        or symbol_map

    local symbols = {}
    local len = kind_len
    for i = 1, len do
        local name = kind_order[i]
        symbols[i] = lspkind.symbolic(name, opts)
    end

    for k, v in pairs(symbols) do
        require("vim.lsp.protocol").CompletionItemKind[k] = v
    end
end

lspkind.setup = lspkind.init
lspkind.presets = kind_presets
lspkind.symbol_map = kind_presets.default

function lspkind.symbolic(kind, opts)
    local mode = opt_mode(opts)
    local formatter = modes[mode]

    -- if someone enters an invalid mode, default to symbol
    if formatter == nil then
        formatter = modes["symbol"]
    end

    return formatter(kind)
end

local function abbreviateString(str, maxwidth, ellipsis_char)
    if vim.fn.strchars(str) > maxwidth then
        str = vim.fn.strcharpart(str, 0, maxwidth) .. (ellipsis_char ~= nil and ellipsis_char or "")
    end

    return str
end

function lspkind.cmp_format(opts)
    if opts == nil then
        opts = {}
    end
    if opts.preset or opts.symbol_map then
        lspkind.init(opts)
    end

    if not opts.maxwidth or type(opts.maxwidth) == "number" or type(opts.maxwidth) == "function" then
        opts.maxwidth = {
            abbr = opts.maxwidth,
            menu = opts.maxwidth,
        }
    end

    return function(entry, vim_item)
        if opts.before then
            vim_item = opts.before(entry, vim_item)
        end

        vim_item.kind = lspkind.symbolic(vim_item.kind, opts)

        if opts.menu ~= nil then
            vim_item.menu = (opts.menu[entry.source.name] ~= nil and opts.menu[entry.source.name] or "")
                .. ((opts.show_labelDetails and vim_item.menu ~= nil) and vim_item.menu or "")
        end

        local ellipsis_char = opts.ellipsis_char

        if opts.maxwidth.menu then
            local maxwidth = opts.maxwidth.menu
            maxwidth = type(maxwidth) == "function" and maxwidth() or maxwidth
            vim_item.menu = abbreviateString(vim_item.menu, maxwidth, ellipsis_char)
        end

        if opts.maxwidth.abbr then
            local maxwidth = opts.maxwidth.abbr
            maxwidth = type(maxwidth) == "function" and maxwidth() or maxwidth
            vim_item.abbr = abbreviateString(vim_item.abbr, maxwidth, ellipsis_char)
        end

        return vim_item
    end
end

return lspkind
