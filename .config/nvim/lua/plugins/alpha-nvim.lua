return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-mini/mini.icons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local v = vim.version()
        local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

        -- Set header
        dashboard.section.header.val = {
            "$$$$$$$$\\ $$\\ $$\\                       $$\\ $$\\ ",
            "\\____$$  |\\__|$$ |                      $$ |\\__|",
            "    $$  / $$\\ $$$$$$$\\   $$$$$$\\   $$$$$$$ |$$\\ ",
            "   $$  /  $$ |$$  __$$\\  \\____$$\\ $$  __$$ |$$ |",
            "  $$  /   $$ |$$ |  $$ | $$$$$$$ |$$ /  $$ |$$ |",
            " $$  /    $$ |$$ |  $$ |$$  __$$ |$$ |  $$ |$$ |",
            "$$$$$$$$\\ $$ |$$$$$$$  |\\$$$$$$$ |\\$$$$$$$ |$$ |",
            "\\________|\\__|\\_______/  \\_______| \\_______|\\__|",
        }

        dashboard.section.buttons.val = {
            dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰮗   Find file", ":cd $HOME | Telescope find_files<CR>"),
            dashboard.button("e", "   File Explorer", ":cd $HOME | Neotree<CR>"),
            dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "   Configuration", ":e ~/.config/nvim/lua/user/config.lua<CR>"),
            dashboard.button("R", "󱘞   Ripgrep", ":Telescope live_grep<CR>"),
            dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
        }

        function centerText(text, width)
            local totalPadding = width - #text
            local leftPadding = math.floor(totalPadding / 2)
            local rightPadding = totalPadding - leftPadding
            return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
        end

        dashboard.section.footer.val = {
            centerText(version, 50),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}
