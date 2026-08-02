local MilitarySelected = nil

local MilitaryDropdown = TrollTab:AddDropdown({
    Name = "اختيار اللاعب",
    Default = "",
    Multi = false,
    Options = GetPlayerNames(),
    Callback = function(name)
        MilitarySelected = Players:FindFirstChild(name)
    end
})

TrollTab:AddButton({
    Name = "تحديث قائمة اللاعبين",
    Callback = function()
        MilitaryDropdown:Set(GetPlayerNames())
    end
})
