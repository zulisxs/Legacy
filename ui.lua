-- Cargar WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- Ventana
local Window = WindUI:CreateWindow({
    Title     = "Anime Legacy",
    Icon      = "door-open",
    Folder    = "Anime Legacy",
    Theme     = "Dark",
    ToggleKey = Enum.KeyCode.RightShift, -- Tecla para mostrar/ocultar
    Resizable = true,
})

-- Pestañas
local MainTab     = Window:Tab({ Title = "Principal",     Icon = "home" })
local SettingsTab = Window:Tab({ Title = "Ajustes",      Icon = "settings" })

-- Pestaña Principal
MainTab:Paragraph({
    Title = "Bienvenido",
    Desc  = "Esta es una UI simple hecha con WindUI.",
    Color = "Blue",
})

MainTab:Button({
    Title    = "Saludar",
    Desc     = "Muestra una notificación",
    Callback = function()
        WindUI:Notify({
            Title    = "¡Hola!",
            Content  = "Presionaste el botón.",
            Duration = 3,
            Icon     = "check",
        })
    end
})

MainTab:Toggle({
    Title    = "Activar función",
    Desc     = "Enciende o apaga algo",
    Value    = false,
    Callback = function(state)
        print("Función activada:", state)
    end
})

MainTab:Slider({
    Title    = "Velocidad",
    Desc     = "WalkSpeed del jugador",
    Step     = 1,
    Value    = { Min = 16, Max = 100, Default = 16 },
    Callback = function(value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = value
        end
    end
})

-- Pestaña Ajustes
SettingsTab:Input({
    Title       = "Tu nombre",
    Placeholder = "Escribe aquí...",
    Callback    = function(text)
        print("Nombre:", text)
    end
})

SettingsTab:Keybind({
    Title    = "Tecla para abrir/cerrar",
    Value    = "RightShift",
    Callback = function(key)
        Window:SetToggleKey(Enum.KeyCode[key])
    end
})
