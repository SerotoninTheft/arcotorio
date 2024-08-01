script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    if player and player.get_main_inventory() then 
        player.get_main_inventory().insert({name="Arco-bead", count=15})
    end
end)

script.on_event(defines.events.on_cutscene_finished, function(event)
    local player = game.get_player(event.player_index)
    if player and player.get_main_inventory() then 
        player.get_main_inventory().insert({name="Arco-bead", count=15})
    end
end)

script.on_event(defines.events.on_cutscene_cancelled, function(event)
    local player = game.get_player(event.player_index)
    if player and player.get_main_inventory() then 
        player.get_main_inventory().insert({name="Arco-bead", count=15})
    end
end)