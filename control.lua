local util = require("util")

script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)

    local start = function()
        return {
            ["Arco-bead"] = 20
        }
    end

    util.insert_safe(player, start())
end)