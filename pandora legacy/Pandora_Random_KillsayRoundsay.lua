//Hello My name is Zuzie 
//this is my first time working on lua for pandora legacy(csgo 2018)
//I hope you like it

local round_messages = {
    "999 hook",
    "999hook",
    "999",
    "twojstary 4.0",
    "SAS beta",
    "missware.cc",
    "bullshit.T",
    "C++",
    "000,1$",
    "Hitware",
    "game bandit V1P Visual Notecoil now",
    "sadware",
    "idk.com",
    "dw++",
    "AAAAAAAAAAAAAAAAAAAAAAAAA",
    "lol",
    "Ty",
    "Crimson | Goddes",
    "SAS",
    "Pasteware",
    "Broken Cheat",
    "Asmodeus"
}

local kill_messages = {
    "dw++",
    "Killed by zuzie",
    "shit coded in 1mn"
}

local killsay_enabled = ui.add_checkbox("Enable killsay")
local roundsay_enabled = ui.add_checkbox("Enable roundsay")

local next_roundsay = ""
local last_kill_time = 0
local sent_kill_messages = {}

local function send_roundsay()
    if not roundsay_enabled:get() then
        return
    end

    local message = round_messages[math.random(1, #round_messages)]
    
    while message == next_roundsay do
        message = round_messages[math.random(1, #round_messages)]
    end

    next_roundsay = message

    local roundsay = "say " .. message
    engine.execute_client_cmd(roundsay)
end

local function on_round_start(event)
    send_roundsay()
end

local function on_player_death(event)
    if not killsay_enabled:get() then
        return
    end

    local attacker = event:get_int("attacker")
    local attacker_index = engine.get_player_for_user_id(attacker)
    local local_index = engine.get_local_player()

    if attacker_index == local_index then
        local cur_time = global_vars.realtime
        
        if cur_time - last_kill_time > 2 then
            last_kill_time = cur_time

            local message = nil
            repeat
                message = kill_messages[math.random(1, #kill_messages)]
            until not sent_kill_messages[message]

            local killsay = "say " .. message
            engine.execute_client_cmd(killsay)

            sent_kill_messages[message] = true
        end
    end
end

callbacks.register("round_start", on_round_start)
callbacks.register("player_death", on_player_death)
