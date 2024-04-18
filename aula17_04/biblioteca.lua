function txtCentro(texto)
  local tamHor = 0
  local tamVer = 0
  local meioHor = 0
  local meioVer = 0
  fonte = love.graphics.newFont(26)
  tamHor = fonte:getWidth(texto)
  tamVer = fonte:getHeight(texto)
  meioHor = (love.graphics.getWidth() - tamHor)/2
  meioVer = (love.graphics.getHeight() - tamVer)/2
  love.graphics.setFont(fonte)
  love.graphics.print(texto, meioHor, meioVer)
end