
PauseState = Class{__includes = BaseState}

function PauseState:init()
    self.image = love.graphics.newImage('pause.png')
end

function PauseState:enter(params)
    sounds['music']:pause()
    sounds['pause']:play()
    self.params = params
end

function PauseState:update(dt)
    -- go back to play if P is pressed
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', self.params)
    end
end

function PauseState:render()
    local scaleFactor = 0.15

    love.graphics.setFont(flappyFont)
    love.graphics.printf('PAUSE', 0, VIRTUAL_HEIGHT/8, VIRTUAL_WIDTH, 'center')
    love.graphics.draw(self.image, VIRTUAL_WIDTH/2 - self.image:getWidth()*scaleFactor/2, VIRTUAL_HEIGHT/2 - self.image:getHeight()*scaleFactor/2, 0, scaleFactor, scaleFactor)
end

function PauseState:exit()
    sounds['music']:play()
end
