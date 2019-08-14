function love.load()
  button = {}
  button.x = 200
  button.y = 200
  button.size = 50

  score = 0
  timer = 10
  gamestate = 1

  myFont = love.graphics.newFont(40)
end

function love.update(dt)
  if gamestate == 2 then
    if timer > 0 then
      timer = timer - dt
    elseif timer < 0 then
      timer = 0
      gamestate = 1
    end
  end

end

function love.draw()
  if gamestate == 2 then
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", button.x, button.y, button.size)
  end

  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(myFont)
  love.graphics.print("Score: " .. score)
  love.graphics.print("Time: " .. math.ceil(timer), 400, 0)

  if gamestate == 1 then
    love.graphics.printf("Click To Start Game", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
  end
end

function love.mousepressed(x, y, b, istouch)
  if b == 1 and gamestate == 2 then
    if dist(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
      score = score + 1
      button.x = math.random(button.size, love.graphics.getWidth() - button.size)
      button.y = math.random(button.size, love.graphics.getHeight() - button.size)
    end
  end

  if gamestate == 1 then
    timer = 10
    score = 0
    gamestate = 2
  end
end

function dist(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
