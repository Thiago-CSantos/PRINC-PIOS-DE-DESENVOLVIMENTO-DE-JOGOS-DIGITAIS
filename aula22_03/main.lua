
-- apelido biblioteca
local lg = love.graphics
local lk = love.keyboard
personagem = {posX= 0, posY=0,veloc = 150, img = nil}
tela = {hor = lg.getWidth(), ver = lg.getHeight()}

-- Timers para limitação de tiros
podeAtirar = true
atiraMax = 0.2
tempoTiro = atiraMax
  
-- Controle dos tiros
imgProj = nil
disparos = {}
  
function love.load()
  
  fundo = lg.newImage('Espaco.png')
  personagem.img = lg.newImage('Nave.png')
  meioX = (tela.hor - personagem.img:getWidth()) / 2
  meioY = (tela.ver - personagem.img:getHeight()) / 2
  personagem.posX, personagem.posY = meioX, meioY
  
  imgProj = lg.newImage('projetil.png')
end

function love.update(dt)
  
 if lk.isDown('escape') then
   love.event.push('quit')
 end
 
 if lk.isDown('a', 'left') then
   if personagem.posX > 0 then
     personagem.posX = personagem.posX - (personagem.veloc * dt)
   end
   
 elseif lk.isDown('d', 'right') then
 if personagem.posX < (tela.hor - personagem.img:getWidth()) then
   personagem.posX = personagem.posX + (personagem.veloc * dt)
 end
end


 -- Timer de tiros
 tempoTiro = tempoTiro - (1 * dt)
 
 if tempoTiro < 0 then
   podeAtirar = true
  end 

-- COntrole de temporização de disparo
  if lk.isDown('space', 'rctrl', 'lctrl') and podeAtirar then
    -- Criar uma instancia do projetil
    novo = {x=personagem.posX + personagem.img:getWidth()/2, y = personagem.posY, img = imgProj}
    
    table.insert(disparos, novo)
    podeAtirar = false
    tempoTiro = atiraMax
  end

  -- Animação do movimento do disparo
  for i, proj in ipairs(disparos) do
    proj.y = proj.y - (400*dt)
    
    if proj.y < 0 then -- remover disparos 
      table.remove(disparos,i)
    end
  end
end


function love.draw()
  lg.draw(fundo, 0, 0)
  lg.draw(personagem.img, personagem.posX, personagem.posY)
  
  -- Atualizar a lista de disparos
  for i, proj in ipairs(disparos) do
    lg.draw(proj.img, proj.x, proj.y)
  end
end