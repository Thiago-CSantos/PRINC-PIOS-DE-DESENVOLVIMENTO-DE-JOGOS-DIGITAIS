local LG = love.graphics
local LK = love.keyboard

personagem = {pox = 0, posy = 0, valor = 150, img = nil}
tela = {hor = LG.getWidth(), ver = LG.getHeight()}

--controle de jogo de tiros
vivo = true
pontos = 0

podeAtirar = true
atirarMax = 0.2
tempoTiro = atirarMax

imgProj = nil
disparos = {}

dtMaxCriarInimigo = 0.8 
dtAtualInimigo = dtMaxCriarInimigo
margemInimigo = 10

imgInimigo = nil
inimigos = {}
introMusic = love.audio.newSource('intro.wav', 'static');

function love.load()
  fundo = LG.newImage('Espaco.png')
  personagem.img = LG.newImage('Nave.png')
  meioX = (tela.hor - personagem.img:getWidth()) / 2
  meioY = (tela.ver - personagem.img:getHeight()) / 2
  personagem.posX, personagem.posY = meioX, meioY
  imgProj = LG.newImage('projetil.png')
  imgInimigo = LG.newImage('Nave-Inimiga.png')
  margemInimigo = margemInimigo + (imgInimigo:getWidth() /2)
  tiro = love.audio.newSource('tiro.wav', 'static')
  introMusic:play()
end

function love.draw()
  
  LG.draw(fundo, 0, 0)
  if vivo then
    LG.draw(personagem.img, personagem.posX, personagem.posY)
  else
    LG.printf("GAME OVER - R para reiniciar!", LG.getWidth()/2 - 100, LG.getHeight()/2 - 100, 200, 'center')
  end
  
  for i, proj in ipairs(disparos) do
    LG.draw(proj.img, proj.x, proj.y)
  end
  
  for i, vilao in ipairs(inimigos) do
    LG.draw(vilao.img, vilao.x, vilao.y, 0, 1, 1, vilao.img:getWidth()/2, vilao.img:getHeight()/2)
    if projeto then 
    mh, mv = vilao.img:getWidth() / 2, vilao.img:getHeight() / 2
    LG.rectangle('line', vilao.x - mh, vilao.y - mv, mh * 2, mv*2)
  end
  
end
  
  
end

function love.update(dt)
  if LK.isDown('s', 'down') then
    personagem.posY = personagem.posY + (personagem.valor * dt)
  end
  if LK.isDown('p') then
    projeto = not projeto    
  end
  
  if LK.isDown('escape') then
    love.event.quit()
  end
  if LK.isDown ('a','left') then
    if personagem.posX > 0 then
      personagem.posX = personagem.posX - (1000 * dt)
      end
    elseif LK.isDown('d', 'right') then
      if personagem.posX < (tela.hor - personagem.img:getWidth()) then
        personagem.posX = personagem.posX + (1000 * dt)
    end
  end
  
  if LK.isDown ('w','up') then
    if personagem.posY > 0 then
      personagem.posY = personagem.posY - (personagem.valor * dt)
      end
    
  end
  
  tempoTiro = tempoTiro - 100 *dt
  
  if tempoTiro < 0 and vivo then
    podeAtirar = true
  end
  
  if LK.isDown('space','rctrl', 'lctrl') and podeAtirar then
    tiro:play()
    novo = {x=personagem.posX + personagem.img:getWidth()/2 - 4, y = personagem.posY, img = imgProj}
    table.insert(disparos, novo)
    podeAtirar = false
    tempoTiro = atirarMax
  end
  
  for i, proj in ipairs(disparos) do
    proj.y = proj.y - (250 * dt)
    if proj.y < 0 then
      table.remove(disparos, i)
    end
  end
  
  dtAtualInimigo = dtAtualInimigo - (1 * dt)
    if dtAtualInimigo < 0 then
      dtAtualInimigo = dtMaxCriarInimigo
      math.randomseed(os.time())
      posDinamica = math.random(margemInimigo, LG.getWidth() - margemInimigo)
      nvInimigo = {x = posDinamica, y=10, img = imgInimigo}
      table.insert(inimigos, nvInimigo)
    end
    
    for i, vilao in ipairs(inimigos) do
      vilao.y = vilao.y + (200 *dt)
      if vilao.y > LG.getHeight() then
        table.remove(inimigos, i)
      end
    end

  --Detecção de colisões
  for i, atual in ipairs(inimigos) do
    
    mh = atual.img:getWidth()/2
    mv = atual.img:getHeight() /2
    
    for j, proj in ipairs(disparos) do
      if verColisao( atual.x - mh, atual.y - mv, 2*mh, 2*mv, proj.x, proj.y, proj.img:getWidth(), proj.img:getHeight())
        then
          table.remove(disparos, j)
          table.remove(inimigos, i)
          pontos = pontos + 10
        end
      end
      -- verificar se o inimigo colidiu com o personagem
      if verColisao( atual.x - mh, atual.y - mv, 2*mh, 2*mv, personagem.posX, personagem.posY, personagem.img:getWidth(), personagem.img:getHeight())
      then 
        table.remove(inimigos, i)
        vivo = false
      end
    end
    if not vivo and LK.isDown('r') then
      disparos = {}
      inimigos = {}
      
      tempoTiro = atirarMax
      dtAtualInimigo = dtMaxCriarInimigo
      
      personagem.x = meioX
      personagem.y = meioY
      vivo = true
      pontos = 0
      projeto = true
    end
    

end

    function verColisao(x1, y1, w1, h1, x2, y2, w2, h2)
      return x2 + w2 >= x1 and x2 <= x1 + w1 and y2 + h2 >= y1 and y2 <= y1 + h1
    end
    