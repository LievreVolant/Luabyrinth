local Entite = require "class.entite"
local Laby = require "class.laby"
local Joueur = Entite:extend()

function Joueur:new(skin)
    Joueur.super.new(self, 300, 20, skin)
end

function Joueur:keyPressed(key, listOfBullets)
    local x = self.tile_x
    local y = self.tile_y

    if key == "left" then
        x = x - 1
    elseif key == "right" then
        x = x + 1
    elseif key == "up" then
        y = y - 1
    elseif key == "down" then
        y = y + 1
    end

    if Laby:isEmpty(x, y) then
        self.tile_x = x
        self.tile_y = y
    end
end