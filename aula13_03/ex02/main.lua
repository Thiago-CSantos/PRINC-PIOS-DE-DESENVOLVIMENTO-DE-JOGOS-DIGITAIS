function love.load()
  w = love.graphics.getWidth()
  h = love.graphics.getHeight()
  
   local l,a, flags = love.window.getMode()
   so = love.system.getOS()
  largura, altura = love.window.getDesktopDimensions(flags.display)
  
  larguraJanela = love.graphics.getWidth()
  alturaJanela = love.graphics.getHeight()
end

function love.update(dt)
  
end

function love.draw()
  love.graphics.print("SO: "..so, 100,100)
  love.graphics.print("Resolução do monitor: ", 100,120)
  love.graphics.print("Largura: "..largura .."x altura" .. altura, 110, 140)
  love.graphics.print("Resolução da janela do jogo: ".. larguraJanela .. "x altura" .. alturaJanela, 110,180)
end