local Laby = Object:extend()

function Laby:new(tiles, debut, arrivee)
    self.tiles = tiles
    self.debut = debut
    self.arrivee = arrivee

    self.image = love.graphics.newImage("images/bricks.png")
    self.width = (self.image:getWidth() / 7)
    self.height = (self.image:getHeight() / 7)
    self.quads = {}

    for i = 0, 6 do
        for j = 0, 6 do
            table.insert(self.quads, love.graphics.newQuad(1 + j * self.width-1, 1 + i * self.height-1, self.width, self.height, self.image:getWidth(), self.image:getHeight()))
        end
    end
end

function Laby:isEmpty(x, y)
    return self.tiles[y][x] == 9
end

function Laby:draw()
    for i,row in ipairs(self.tiles) do
        for j, tile in ipairs(row) do
            if tile ~= 0 then
                -- Draw the image with the correct quad
                love.graphics.draw(self.image, self.quads[tile], j * self.width, i * self.height)
            end
        end
    end
end

return Laby