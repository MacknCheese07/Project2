require("L5")
-- By: Raegan Stempora

-- Images were turned into Variables so they are easier to work with
cat = loadImage('assets/cat.png')
cherry = loadImage('assets/cherries.png')
cloud = loadImage('assets/cloud.png')
fire = loadImage('assets/fire.png')
flower = loadImage('assets/flower.png')
heart = loadImage('assets/heart.png')
leaf = loadImage('assets/leaf.png')
moon = loadImage('assets/moon.png')
planet = loadImage('assets/planet.png')
raven = loadImage('assets/raven.png')
tomato = loadImage('assets/tomato.png')
umbrella = loadImage('assets/umbrella.png')

-- Table of images
tiles = {cat,cherry,cloud,fire,flower,heart,leaf,moon,planet,raven,tomato,umbrella}

-- Randomly shuffles the tiles so there are no repeats in the grid
function shuffleTiles()
  for i = #tiles, 2, -1 do
    local j = math.random(i)
    tiles[i], tiles[j] = tiles[j], tiles[i]
  end
end

function setup()
  size(420, 560)
  angleMode(DEGREES)
  textAlign(CENTER)
  rectMode(CENTER)
 -- Starting screen 
  background(92, 120, 181)
  fill (62, 61, 98)
  strokeWeight (10)
  line(0,0,width,height)
  line(width,0,0,height)
  rect(width/2,height/2,360,490)
  -- Click Me Text
  -- Calls a new font
  font = loadFont('assets/NewFont.otf')
  textFont(font,50)
  fill(255)
  text('Click me!',width/2,height/2)
  -- Basic starting calls.
  windowTitle("Project 2")
  describe('Makes a backsplash of hand drawn tiles that randomly change position when the mouse is clicked.')
end

function mouseClicked()
  -- Shuffle the tiles before drawing 
  shuffleTiles()
  -- Puts stroke weight at 0
  strokeWeight(0)
  -- Starting point for the grid
  x = 0
  y = 0
  -- Makes a 3x4 grid
  for i = 1, 12, 1 do
    -- Draws each shuffled image once
    image(tiles[i],x,y,140,140)
    -- Moves y value
    y = y + 140
    -- Resets the grid
    if y >= 560 then
      y = 0
      x = x + 140
    end
  end
    -- Next lines draw the borders of the tiles using for loops
    -- Sets the starting height of the horizontal border lines
    ry = 0
    -- Draws the horizontal lines
  for i = 1,5,1 do 
      fill(62, 61, 98)
      rect(width/2,ry, width, 2)
      -- Updates the height
      ry = ry + 140
    end
    -- Sets the starting width for the vertical border lines
      rw = 0
    -- Draws the vertical lines
  for i = 1,5,1 do 
      fill(62, 61, 98)
      rect(rw,height/2, 2, height)
      -- Updates the width
      rw = rw + 140
    end
end
-- Empty draw function
function draw()
end
