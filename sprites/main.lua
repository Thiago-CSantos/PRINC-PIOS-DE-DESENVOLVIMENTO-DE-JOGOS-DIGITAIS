
local lg = love.graphics
local personagem
local quadros = {}
local atual = nil -- animação
local passo = 1
local tempo = 0.1 -- tempo de atualização

local spriteX = 100
local spriteY = 100
local velocidade = 100 -- velocidade de movimento em pixels por segundo

function love.load()
    lg.setBackgroundColor(0, 0, 0)
    personagem = lg.newImage('sprite-dir.png')
    quadros = {} -- Inicialize a tabela para armazenar os quadros
    for c = 1, 8 do
        quadros[c] = lg.newQuad((c - 1) * 32, 0, 32, 32, 256, 32)
    end
    
    atual = quadros[1]
    
    
    
    intervalo = 0.1  -- Intervalo de 0.1 segundo entre os quadros
    tempoDecorrido = 0  -- Inicialize o tempo decorrido como 0
    quadroAtual = 1  -- Mantenha o controle do quadro atual
end

function love.update(dt)
  --Thiago
    tempoDecorrido = tempoDecorrido + dt
    
    if tempoDecorrido >= intervalo then
        quadroAtual = quadroAtual % #quadros + 1  -- Avance para o próximo quadro, ciclando de volta para o primeiro quando necessário
        tempoDecorrido = tempoDecorrido - intervalo
    end
    -- Movimentação do sprite
    if love.keyboard.isDown("up") then
        spriteY = spriteY - velocidade * dt
    end
    if love.keyboard.isDown("down") then
        spriteY = spriteY + velocidade * dt
    end
    if love.keyboard.isDown("left") then
        spriteX = spriteX - velocidade * dt
    end
    if love.keyboard.isDown("right") then
        spriteX = spriteX + velocidade * dt
    end
    --Professor
    tempo = tempo + dt
    
    if tempo > 0.2 then
      tempo = 0.1
      if passo < 8 then
        passo = passo + 1
      else
        passo = 1
      end
      atual = quadros[passo]
    end
    
end

function love.draw()
  -- Thiago
    lg.draw(personagem, quadros[quadroAtual], spriteX, spriteY)
  --Professor
  lg.draw(personagem, atual,100,100)
end
