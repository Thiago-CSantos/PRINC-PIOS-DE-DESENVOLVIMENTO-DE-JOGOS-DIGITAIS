lume = require('lume')

local lk = love.keyboard.isDown
local lg = love.graphics

personagem = {
    
  }
  
  carteira = {
    
  }
  moeda = lg.newImage('bitcoin.png')
  
function love.load()
    lg.setFont(lg.newFont(16))
    Inicia()
end

function love.draw()
  lg.draw(personagem.img, personagem.x, personagem.y,0,personagem.esc, personagem.esc, personagem.img:getWidth()/2, personagem.img:getHeight()/2)
  
  for c, atual in ipairs(carteira) do
    lg.draw(atual.img, atual.y, atual.x, 0,1,1,atual.img:getWidth()/2, atual.img:getHeight()/2)
  end
end

function love.update(dt)
  if lk('i') then
    Inicia()
  end
  if lk('escape') then
    love.event.quit()
  end
  if lk('left') and personagem.x > personagem.tam/2 then
    personagem.x = personagem.x - personagem.v * dt
  end
  
  if lk('right') and personagem.x < lg.getWidth() - personagem.tam / 2 then
    personagem.x=personagem.x + personagem.v * dt
  end
  
  if lk('up') and personagem.y > personagem.tam/2 then
    personagem.y = personagem.y - personagem.v * dt
  end
  
  if lk('down') and personagem.y < lg.getHeight() - personagem.tam / 2 then
    personagem.y = personagem.y + personagem.v *dt
  end
  
  for c = #carteira,1,-1 do 
    if temColisao(personagem, carteira[c]) then
      table.remove(carteira,c)
      personagem.esc = personagem.esc +0.05
      personagem.tam = 50 * personagem.esc
    end
    
  end
  
end



function temColisao(p1,p2)
  local dist = math.sqrt((p1.x - p2.x)^2+(p1.y-p2.y)^2)
  return (dist < (p1.tam + p2.tam) /2 )
end


function Inicia()
  personagem = {x=30,y50,tam=50,esc=1,img=nil, v=200}
  carteira = {}
  
  math.randomseed(os.time())
  personagem.img= lg.newImage('Coletor.png')
  
  for c = 1, 25 do
    table.insert(carteira, {
          x = math.random(50,lg.getWidth() -50 ),
          y= math.random(50,lg.getHeight() -50),
          img = moeda,
          tam = 25
        }
      )
    end
end

  