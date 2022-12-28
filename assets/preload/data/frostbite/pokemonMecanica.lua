-- Si creen que este code es igual que los otros créeme que no lo es (Nickobelit)
--Coded by Laztrix & Nickobelit (Yo p)
local yourtriallife = 10
idle = true
function onCreate()
 if difficultyName == 'Hard' then
    makeAnimatedLuaSprite('typhlosion', 'characters/gold/TYPHLOSION_MECHANIC', -20, 745); 
    addAnimationByPrefix('typhlosion', 'idle', 'Idle', 24,false)
    addAnimationByPrefix('typhlosion', 'attack', 'Scream', 24,false); 
    objectPlayAnimation('typhlosion', 'idle',true); 
    scaleObject('typhlosion', 1.6,1.6);
    addLuaSprite('typhlosion', false);
    
    makeLuaSprite('blueBar','', 56, 195);
    makeGraphic('blueBar',15,350,'305385')
    scaleObject('blueBar', 1,1)
    setProperty('blueBar.alpha',1)
    setObjectCamera("blueBar", 'hud')
    addLuaSprite('blueBar', false);
   
    makeLuaSprite('lightblueBar','', 56, 550);
    makeGraphic('lightblueBar',15,350,'AED4F8')
    scaleObject('lightblueBar', 1,0.1)
    setProperty('lightblueBar.alpha',1)
    setObjectCamera("lightblueBar", 'hud')
    addLuaSprite('lightblueBar', false);

    makeAnimatedLuaSprite('pokemonBar', 'TyphlosionVit', 25, 136);
    addAnimationByPrefix('pokemonBar', 'idle1', 'Typh1 instance 1', 24, true);
    addAnimationByPrefix('pokemonBar', 'idle2', 'Typh2 instance 1', 24, true);
    addAnimationByPrefix('pokemonBar', 'idle3', 'Typh3 instance 1', 24, true);
    addAnimationByPrefix('pokemonBar', 'idle4', 'Typh4 instance 1', 24, true);
    addAnimationByPrefix('pokemonBar', 'idle5', 'Typh5 instance 1', 24, true);
    scaleObject('pokemonBar', 1,1);
    addLuaSprite('pokemonBar', true);
    setObjectCamera("pokemonBar", 'hud')
    objectPlayAnimation('pokemonBar','idle1',true)
     
    makeAnimatedLuaSprite('freezeBar', 'Thermometer', 20, 190);
    addAnimationByPrefix('freezeBar', 'idle1', 'Therm1', 24, false);
    addAnimationByPrefix('freezeBar', 'idle2', 'Therm2', 24, false);
    addAnimationByPrefix('freezeBar', 'idle3', 'Therm3', 24, false);
    scaleObject('freezeBar', 1,1);
    addLuaSprite('freezeBar', true);
    setObjectCamera("freezeBar", 'hud')
    
    makeAnimatedLuaSprite('BotonPendulo', 'botonPendulo', 1100, 390);
    addAnimationByPrefix('BotonPendulo', 'boton1', 'nonPress', 24, false);
    addAnimationByPrefix('BotonPendulo', 'boton2', 'Pressed', 24, false);
    objectPlayAnimation('BotonPendulo','boton1',false);
    scaleLuaSprite('BotonPendulo', 1.2,1.2); 
    addLuaSprite('BotonPendulo', true);
    setObjectCamera('BotonPendulo', 'other')
    setProperty('BotonPendulo.alpha',0)
      
    setObjectOrder('white', 1);
    setObjectOrder('bg', 2);
    setObjectOrder('dadGroup', 3);
    setObjectOrder('gfGroup', 4);
    setObjectOrder('boyfriendGroup', 5);
    setObjectOrder('typhlosion', 6);
    objectPlayAnimation('freezeBar', 'idle1',true); 
end
end

local mechanic = true
function onUpdatePost(elapsed)
if difficultyName == 'Hard' then
    if curStep == 1376 then
        mechanic = false
        setProperty('BotonPendulo.alpha',0)
    end
    setProperty('fog.alpha',getProperty('lightblueBar.scale.y') * 1)

if curStep > 63 then
    if getProperty('lightblueBar.scale.y') > 0.45 and getProperty('lightblueBar.scale.y') < 0.7 then
        objectPlayAnimation('freezeBar', 'idle2',true); 
    elseif getProperty('lightblueBar.scale.y') > 0.7 then
        objectPlayAnimation('freezeBar', 'idle3',true); 
    elseif getProperty('lightblueBar.scale.y') < 0.45 then
        objectPlayAnimation('freezeBar', 'idle1',true); 
    end

if keyJustPressed('space') and yourtriallife > -1 or (getMouseX('camHUD') > 1100 and getMouseX('camHUD') < 1250) and (getMouseY('camHUD') > 410 and getMouseY('camHUD') < 540 and mouseClicked('left')) and yourtriallife > -1 then 
    if yourtriallife == 8 then
        objectPlayAnimation('pokemonBar','idle2',true)
    elseif yourtriallife == 5 then
        objectPlayAnimation('pokemonBar','idle3',true)
    elseif yourtriallife == 3 then
        objectPlayAnimation('pokemonBar','idle4',true)
    elseif yourtriallife == 0 then
       objectPlayAnimation('pokemonBar','idle5',true)
       doTweenY('chauPokemon','typhlosion',1300,2, 'linear');
       playSound('TyphlosionDeath', 0.5)
    end
    if mechanic then
        idle = false     
        runTimer('idle', 1.4)
        yourtriallife = yourtriallife - 1
        objectPlayAnimation('typhlosion', 'attack',true); 
        objectPlayAnimation('BotonPendulo','boton2',false)
        playSound('TyphlosionUse', 0.5)
        if getProperty('lightblueBar.y') < 550 then
        doTweenY('lightbluey','lightblueBar',getProperty('lightblueBar.y')+50,1,'expoOut')
        end
        if getProperty('lightblueBar.scale.y') > 0.2 then
        doTweenY('lightblueya','lightblueBar.scale',getProperty('lightblueBar.scale.y')-0.30,1,'expoOut')
        end
    end
--debugPrint("no way its working")
end
end
end
end

function onBeatHit()--Este sistema para el Idle es mejor Laz xd
if difficultyName == 'Hard' then
    if mechanic then
   if idle == true then
    if curBeat % 2 == 0 then
     objectPlayAnimation('typhlosion','idle',true)
end
end
if curBeat >= 11 then
if curBeat % 1 == 0 then
   -- debugPrint(getProperty('lightblueBar.scale.y'))  -- i can see the value shit
    setProperty('health',getProperty('health')- 0.12 * getProperty('lightblueBar.scale.y'))
setProperty('lightblueBar.y',getProperty('lightblueBar.y')-1.8)
setProperty('lightblueBar.scale.y',getProperty('lightblueBar.scale.y')+0.01)
end
end
end
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if difficultyName == 'Hard' then
if tag == 'idle' then
idle=true
end
end
if tag == 'bajaVidaP' then
setProperty('health',getProperty('health') - 0.4)
playSound('Frostbite_bite', 0.5)
triggerEvent('Play Animation','singDOWNmiss', 'bf')
end
end

function onStepHit()
if difficultyName == 'Hard' then
if curStep == 35 then
idle = false
objectPlayAnimation('typhlosion', 'attack'); 
runTimer('idle', 1.6)
end
end
if curStep == 918 then
triggerEvent('Play Animation','split','gf');
runTimer('bajaVidaP', 0.5)
end
if curStep == 1024 then
triggerEvent('Play Animation','split','gf');
runTimer('bajaVidaP', 0.5)
end
if curStep == 1136 then
triggerEvent('Play Animation','split','gf');
runTimer('bajaVidaP', 0.5)
end
end