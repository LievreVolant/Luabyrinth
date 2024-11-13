-- Lance le debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end

---------------------------- DEBUT ----------------------------



-- Turn off that the program should wait to be closed before showing the prints
io.stdout:setvbuf("no")

function love.load()
    
    love.window.setMode(400, 240)

    Object = require "classic"
    local Laby = require "class.laby"
    local Niveau = require "class.niveau"
    local Joueur = require "class.joueur"

    local laby_01 = Laby({
        {  4,  9, 26,  6,  6,  6, 41,  6, 27 },
        { 11,  9, 18,  9,  9,  9, 11,  9, 11 },
        { 11,  9,  9,  9,  4,  9, 11,  9, 11 },
        { 33,  6,  6,  6, 34,  9, 18,  9, 11 },
        {  9,  9,  9,  9,  9,  9,  9,  9, 11 },
        {  5,  6,  6,  6,  6,  6,  6,  6, 34 }}, {5, 1}, {5, 1})

    local laby_02 = Laby({
        { 26,  6, 41,  6, 41,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  7 },
        { 11,  9, 11,  9, 18,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 },
        { 11,  9, 18,  9,  9,  9,  5,  6,  6,  6,  6,  6,  6,  6,  6, 27 },
        { 11,  9,  9,  9,  4,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9, 11 },
        { 33,  6,  6,  6, 47,  6,  6,  6,  6,  6,  6,  6,  6, 27,  9, 11 },
        { 26,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6, 48,  9, 11 },
        { 11,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9, 18,  9, 11 },
        { 40,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  7,  9,  9,  9, 11 },
        { 11,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  4,  9, 11 },
        { 33,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6, 34,  9, 11 },
        {  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9, 11 },
        {  5,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6, 34 }}, {5, 1}, {5, 1})

    Niv_01 = Niveau(laby_01)
    Niv_02 = Niveau(laby_02)
    Niveau_Act = 0

    Joueur = Joueur(Niv_01.laby)
end

function love.draw()
    if Niveau_Act == 0 then
        Niv_01.laby:draw()
    elseif Niveau_Act == 1 then
        Niv_01.laby:draw()
    elseif Niveau_Act == 2 then
        Niv_02.laby:draw()
    end
end



------------------------------- FIN ----------------------------

-- Améliore le debugger (apparemment)
local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end