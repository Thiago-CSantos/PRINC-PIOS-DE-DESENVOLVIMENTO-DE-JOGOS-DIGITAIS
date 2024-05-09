
local lg = love.graphics
local q = love.graphics.newQuad
personagem = {}
mapa = {}

projeto1 = {
-- 1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
  {1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 2, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 2 }, -- 1
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},  --2

  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--3
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--4
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--5
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--6
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--7
  
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--8
  {4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 5},--9
  
  {1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2},--10
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--11
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--12
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--13
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--14
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--15
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--16
  {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--17
  {4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5},-- 18
}

function love.load()
  personagem.img = lg.newImage('face.png')
  personagem.qx = 2
  personagem.qy = 2
  lg.setBackgroundColor(1,1,1)
  
  -- squads do mapa
  mapa.img = lg.newImage('ambiente.png')
  mapa.larg = mapa.img:getWidth()
  mapa.alt = mapa.img:getHeight()
  mapa.h = (mapa.larg / 3) - 2
  mapa.v = (mapa.alt / 2) -2
  quadros = {}
  
  for l = 0, 1 do --linhas
    for c = 0, 2 do --colunas
      table.insert(quadros, q(1+c*(mapa.h + 2), 1 + l * (mapa.v+2), mapa.h, mapa.v, mapa.larg, mapa.alt))
    end
  end
  
end

function love.draw()
  for i, linha in ipairs(projeto1) do
    for j, qu in ipairs(linha) do
      if qu ~= 0 then
        lg.draw(mapa.img, quadros[qu], (j-0.5)* mapa.h, (i-0.5) * mapa.v)
      end
    end
  end
  lg.draw(personagem.img, (personagem.qx - 0.5) * mapa.h, (personagem.qy - 0.5) * mapa.v)
end

function love.keypressed(tecla)
  local x,y = personagem.qx, personagem.qy
  
  if tecla == 'left' or tecla == 'a' then 
    x = x -1
  elseif tecla == 'right' or tecla == 'd' then
    x = x + 1
  elseif tecla =='up' or tecla == 'w' then
    y=y-1
  elseif tecla == 'down' or tecla == 's' then
    y= y+1
  end
  if podeCaminhar(x,y) then
    personagem.qx = x
    personagem.qy = y
  end
  
end

function podeCaminhar(x,y)
  return projeto1[y][x] == 0
end
