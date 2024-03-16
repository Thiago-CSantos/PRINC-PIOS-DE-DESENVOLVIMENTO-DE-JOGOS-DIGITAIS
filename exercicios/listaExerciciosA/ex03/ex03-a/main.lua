---@diagnostic disable: lowercase-global, deprecated
function love.load()
      controlPoints = {
            { 100, 150 }, -- Ponto inicial
            { 80,  200 }, -- Ponto de controle 1
            { 100, 250 }, -- Ponto de controle 2
            { 150, 300 }  -- Ponto final
      }

      curvePoints = {} -- Array para armazenar os pontos da curva
      numSegments = 50 -- Número de segmentos para a curva
end

function love.draw()
      love.graphics.setColor(1, 1, 1) -- Cor branca
      love.graphics.setLineWidth(2)   -- Largura da linha

      -- Calcular os pontos da curva de Bézier cúbica
      calculateBezierCurve(controlPoints)

      -- Desenhar a curva de Bézier cúbica
      love.graphics.line(curvePoints)

      curva = love.math.newBezierCurve(150, 300, 200, 310, 250, 310, 300, 300)
      love.graphics.line(curva:render())

      curva = love.math.newBezierCurve(300, 300, 360, 250, 360, 200, 350, 150)
      love.graphics.line(curva:render())

      curva = love.math.newBezierCurve(350, 150, 350, 140, 320, 110, 300, 100)
      love.graphics.line(curva:render())

      curva = love.math.newBezierCurve(300, 100, 290, 80, 250, 50)
      love.graphics.line(curva:render())

      curva = love.math.newBezierCurve(250, 50, 225, 40, 200, 50)
      love.graphics.line(curva:render())

      curva = love.math.newBezierCurve(200, 50, 175, 60, 150, 100)
      love.graphics.line(curva:render())

      curva = love.math.newBezierCurve(150, 100, 125, 115, 100, 150)
      love.graphics.line(curva:render())

      love.graphics.setColor(1, 0, 0) -- Define a cor para vermelho
      love.graphics.setPointSize(10)  -- Define o tamanho do ponto
      love.graphics.points(100, 150)

      love.graphics.setPointSize(10)
      love.graphics.points(110, 250)

      love.graphics.setPointSize(10)
      love.graphics.points(150, 298)

      love.graphics.setPointSize(10)
      love.graphics.points(300, 300)

      love.graphics.setPointSize(10)
      love.graphics.points(340, 250)

      love.graphics.setPointSize(10)
      love.graphics.points(350, 150)

      love.graphics.setPointSize(10)
      love.graphics.points(300, 100)

      love.graphics.setPointSize(10)
      love.graphics.points(250, 50)

      love.graphics.setPointSize(10)
      love.graphics.points(200, 50)

      love.graphics.setPointSize(10)
      love.graphics.points(150, 100)
end

function calculateBezierCurve(controlePonto)
      curvePoints = {} -- Limpar os pontos da curva
      for t = 0, 1, 1 / numSegments do
            local x, y = bezierPoint(controlePonto, t)
            table.insert(curvePoints, x)
            table.insert(curvePoints, y)
      end
end

function bezierPoint(points, t)
      local n = #points - 1
      local x, y = 0, 0
      for i = 0, n do
            local binomialCoeff = binomialCoefficient(n, i) * math.pow((1 - t), (n - i)) * math.pow(t, i)
            x = x + binomialCoeff * points[i + 1][1]
            y = y + binomialCoeff * points[i + 1][2]
      end
      return x, y
end

function binomialCoefficient(n, k)
      return factorial(n) / (factorial(k) * factorial(n - k))
end

function factorial(n)
      if n == 0 then
            return 1
      else
            return n * factorial(n - 1)
      end
end
