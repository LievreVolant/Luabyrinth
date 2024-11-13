local Entite = Object:extend()

function Entite:new(tile_x, tile_y, nom_sprite)
    self.tile_x = tile_x
    self.tile_y = tile_y
    if nom_sprite == "clef" then
        self.image = love.graphics.newImage("images/clef")
    else
        self.image = love.graphics.newImage()
    end
end

return Entite