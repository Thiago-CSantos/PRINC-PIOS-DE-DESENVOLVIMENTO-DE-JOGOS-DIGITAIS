function love.load()
  w = love.graphics.getWidth()
  h = love.graphics.getHeight()
  
  fonte = love.graphics.newFont(28)
  fonte2 = love.graphics.newFont("planetkosmos.ttf", 28)
  -- Calcular o tamanho em pixels de um texto
  texto = "Informação para o usuario!!!!!!!!!"
  tamanho = fonte:getWidth(texto)
end

function love.update(dt)
  
end

function love.draw()
  love.graphics.setFont(fonte2)
  love.graphics.print("Texto", w/2, h/2)
  
  love.graphics.setFont(fonte)
  love.graphics.print("Texto", 200, 200)
  
  -- Impressão na tela formatada
  love.graphics.printf("Texto do para o usuario", w/3, h/3, 250,"left")
  love.graphics.printf("Texto do para o usuario 2 ", w/5, h/5, 250,"center")
  love.graphics.printf("Texto do para o usuario 2 ", 450, 900, 250,"right")
  
  love.graphics.printf("Usando texto com tamanho calculado!"..tostring(tamanho), 600, 500, tamanho, "left")
end