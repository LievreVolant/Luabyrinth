local Niveau = Object:extend()

function Niveau:new(laby)
    self.laby = laby
    self.compt = 0
end

return Niveau