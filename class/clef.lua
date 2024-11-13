local Entite = require "class.entite"
local Laby = require "class.laby"
local Clef = Entite:extend()

function Clef:new(laby)
    Clef.super.new(self, laby.debut[0], laby.debut[1], "clef")
end