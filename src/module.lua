local TweenService = game:GetService("TweenService")
local app = {
    tweening = false
}

function app.TweenObjects(Positions: {}, TweenSpeed: NumberValue, AnimationStyle: Enum.EasingStyle, doesReverse: boolean)
    app.tweening = false
    
    for i, array in pairs(Positions) do
        local Object = array[1] -- The UI object is always the first index
        local ArrayLength = rawlen(array) - 1 -- Remove 1, which is the first index(We already have the object)

        -- We loop through everything in the given table, inside of the positions table
        for _1, goalPos in pairs(array) do
      
            -- We check if the index isnt 1, because 1 is the element
            if _1 ~= 1 then
                -- Now we create a tween for the elemet
                local elementTween = TweenService:Create(
                    Object,
                    TweenInfo.new(TweenSpeed or 0,
                        AnimationStyle,
                        Enum.EasingDirection.Out,
                        0,
                        doesReverse or false
                    ),
                    goalPos
                )
                elementTween:Play()  
                
                if elementTween.Completed == true then
                    app.tweening = false
                else
                    app.tweening = true
                end
            end
        end
    end
end

return app
