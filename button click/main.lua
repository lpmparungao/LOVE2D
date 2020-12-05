--load function, initial
function love.load()
  button = {}
  button.x = 250
  button.y = 250
  button.size = 50

  score = 0

  --font variable
  myFont = love.graphics.newFont(40)
end
--update function 60 fps
function love.update(dt)

end
--draw function
function love.draw()
  --set color every after the line
  --love.graphics.setColor(0.59, 1, 0.59)
  --love.graphics.rectangle("fill", 200, 400, 200, 100)
  --set font using variable
  --love love.graphics.setFont(myFOnt)

  --score graphics
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(myFont)
  love.graphics.print(score)
  --shape graphics
  love.graphics.setColor(0.59, 1, 0.59)
  love.graphics.circle("fill", button.x, button.y, button.size)

end

--mousepressed function
--parameters can be renamed
-- x and y are coordinate of mouse pointer
-- b, the button clicked on the mouse
-- left click mouse button is equal to 1
--isTouch is for mobile
function love.mousepressed(x, y, b, isTouch)
  if b == 1 then
    if distanceBetween(button.x, love.mouse.getX(), button.y, love.mouse.getY()) < button.size then
      score = score + 1
      button.x = math.random(70, love.graphics.getWidth() - 50)
      button.y = math.random(70, love.graphics.getHeight() - 50)
    end
  end
end

function distanceBetween (x1, x2, y1, y2)
  return math.sqrt((x1 - x2)^2+(y1 - y2)^2)
end
