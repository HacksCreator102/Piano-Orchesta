local pianoplayer = {}

local keys = {
    ["a"] = Enum.KeyCode.A,
    ["A"] = Enum.KeyCode.A,
    ["b"] = Enum.KeyCode.B,
    ["B"] = Enum.KeyCode.B,
    ["c"] = Enum.KeyCode.C,
    ["C"] = Enum.KeyCode.C,
    ["d"] = Enum.KeyCode.D,
    ["D"] = Enum.KeyCode.D,
    ["e"] = Enum.KeyCode.E,
    ["E"] = Enum.KeyCode.E,
    ["f"] = Enum.KeyCode.F,
    ["F"] = Enum.KeyCode.F,
    ["g"] = Enum.KeyCode.G,
    ["G"] = Enum.KeyCode.G,
    ["h"] = Enum.KeyCode.H,
    ["H"] = Enum.KeyCode.H,
    ["i"] = Enum.KeyCode.I,
    ["I"] = Enum.KeyCode.I,
    ["j"] = Enum.KeyCode.J,
    ["J"] = Enum.KeyCode.J,
    ["k"] = Enum.KeyCode.K,
    ["K"] = Enum.KeyCode.K,
    ["l"] = Enum.KeyCode.L,
    ["L"] = Enum.KeyCode.L,
    ["m"] = Enum.KeyCode.M,
    ["M"] = Enum.KeyCode.M,
    ["n"] = Enum.KeyCode.N,
    ["N"] = Enum.KeyCode.N,  
    ["o"] = Enum.KeyCode.O,
    ["O"] = Enum.KeyCode.O,
    ["p"] = Enum.KeyCode.P,
    ["P"] = Enum.KeyCode.P,
    ["q"] = Enum.KeyCode.Q,
    ["Q"] = Enum.KeyCode.Q,
    ["r"] = Enum.KeyCode.R,
    ["R"] = Enum.KeyCode.R,
    ["s"] = Enum.KeyCode.S,
    ["S"] = Enum.KeyCode.S,
    ["t"] = Enum.KeyCode.T,
    ["T"] = Enum.KeyCode.T,
    ["u"] = Enum.KeyCode.U,
    ["U"] = Enum.KeyCode.U,
    ["v"] = Enum.KeyCode.V,
    ["V"] = Enum.KeyCode.V,
    ["w"] = Enum.KeyCode.W,
    ["W"] = Enum.KeyCode.W,
    ["x"] = Enum.KeyCode.X,
    ["X"] = Enum.KeyCode.X,
    ["y"] = Enum.KeyCode.Y,
    ["Y"] = Enum.KeyCode.Y,
    ["z"] = Enum.KeyCode.Z,
    ["Z"] = Enum.KeyCode.Z,
    ["0"] = Enum.KeyCode.Zero,
    ["1"] = Enum.KeyCode.One,
    ["2"] = Enum.KeyCode.Two,
    ["3"] = Enum.KeyCode.Three,
    ["4"] = Enum.KeyCode.Four,
    ["5"] = Enum.KeyCode.Five,
    ["6"] = Enum.KeyCode.Six,
    ["7"] = Enum.KeyCode.Seven,
    ["8"] = Enum.KeyCode.Eight,
    ["9"] = Enum.KeyCode.Nine,
}

-- Keep track of active keys
local activeKeys = {}

function pianoplayer:play(note, dur)
    local key = keys[note]
    if key then
        local vim = game:GetService("VirtualInputManager")
        vim:SendKeyEvent(true, key, false, game)
        activeKeys[key] = true
        task.wait(dur or 0.03)
        vim:SendKeyEvent(false, key, false, game)
        activeKeys[key] = nil
    end
end

function pianoplayer:sleep(seconds)
    task.wait(seconds)
end

-- Destroy/cleanup function
function pianoplayer:destroy()
    playing = false
    for key, _ in pairs(activeKeys) do
        local vim = game:GetService("VirtualInputManager")
        vim:SendKeyEvent(false, key, false, game)
    end
end

return pianoplayer
