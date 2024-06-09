
--by latter or latter K (no one will get it)


-----------------------------------------------

--this is only useful for things like setProperty and doTweens and things that you can do to LuaSprites in general 

local Character_tag = 'Cleveland'--if you want to make more than one character then make sure that the names are different from each other

-----------------------------------------------

local Character_Image_Name = 'characters/CleveLand'

-----------------------------------------------



--here you can fix the offsets for the animations. i recommended that you make a .json for the character and fix the offsets from there, then just copy and paste the already fixed offsets and you will be done.
offsetI = {'19', '0'}-- idle

offsetL = {'149', '-12'}-- left

offsetD = {'-27', '-7'}-- down

offsetU = {'10', '24'}-- up

offsetR = {'-35', '0'}-- right


-----------------------------------------------

--you can find the animation name in the .xml for the Character
local idle = 'CleveLand idle'

local left = 'CleveLand left'

local down = 'CleveLand down'

local up = 'CleveLand up'

local right = 'CleveLand right'


-----------------------------------------------

--here is the frame for the animations, 24 is the default 

local FrameI = 24--for Idle

local FrameL = 24--for Left

local FrameD = 24--for Down

local FrameU = 24--for Up

local FrameR = 24--for Right 


-----------------------------------------------

--here is the idle option, do you want the idle to loop or not, if the idle doesn't loop, that means the idle animation will play with beats, just like the normal characters

local loopI = false--or true

--heres the option if you want the character to hide or not


-----------------------------------------------
--here you will have the option to ether put the character behind (false) or above (true) the characters AND above all the stage elements.

local above = true--or true


local flip = false-- do you want to flipX the character or not

--here you can choose the size of the character

local xS = 0.9--this is for the X
local yS = 0.9--this is for the Y

-----------------------------------------------
local note = 'CleveLandNotes'--this is for the character to play there animations
-----------------------------------------------
-----------------------------------------------


function onCreate()
makeAnimatedLuaSprite(Character_tag, Character_Image_Name, 1133, 545);

local fuck_this = true
	addAnimationByPrefix(Character_tag, 'IDLE', idle, FrameI, loopI);
	addAnimationByPrefix(Character_tag, 'LEFT', left, FrameL, false);
	addAnimationByPrefix(Character_tag, 'DOWN', down, FrameD, false);
	addAnimationByPrefix(Character_tag, 'UP', up, FrameU, false);
	addAnimationByPrefix(Character_tag, 'RIGHT', right, FrameR, false);

setProperty(Character_tag.. '.flipX', flip)
objectPlayAnimation (Character_tag, 'IDLE', false)

	scaleObject(Character_tag, xS, yS);
	addLuaSprite(Character_tag, above);


	end


local singing = {"LEFT", "DOWN", "UP", "RIGHT"}

function opponentNoteHit(id, direction, noteType, isSustainNote)
if noteType == note then
runTimer('idle back', 0.5)
fuck_this = false

objectPlayAnimation(Character_tag, singing[direction + 1], false);


if isSustainNote then
objectPlayAnimation(Character_tag, singing[direction + 1], true);
end


if direction == 0 then
	setProperty(Character_tag.. '.offset.x', offsetL[1]);

	setProperty(Character_tag.. '.offset.y', offsetL[2]);



elseif direction == 1 then
	setProperty(Character_tag.. '.offset.x', offsetD[1]);
	setProperty(Character_tag.. '.offset.y', offsetD[2]);



elseif direction == 2 then
	setProperty(Character_tag.. '.offset.x', offsetU[1]);
	setProperty(Character_tag.. '.offset.y', offsetU[2]);



elseif direction == 3 then
	setProperty(Character_tag.. '.offset.x', offsetR[1]);
	setProperty(Character_tag.. '.offset.y', offsetR[2]);



		end
end

end

function goodNoteHit(id, direction, noteType, isSustainNote)
if noteType == note then

runTimer('idle back', 0.5)

fuck_this = false

objectPlayAnimation(Character_tag, singing[direction + 1], false);


if isSustainNote then
objectPlayAnimation(Character_tag, singing[direction + 1], true);
end


if direction == 0 then
	setProperty(Character_tag.. '.offset.x', offsetL[1]);

	setProperty(Character_tag.. '.offset.y', offsetL[2]);



elseif direction == 1 then
	setProperty(Character_tag.. '.offset.x', offsetD[1]);
	setProperty(Character_tag.. '.offset.y', offsetD[2]);



elseif direction == 2 then
	setProperty(Character_tag.. '.offset.x', offsetU[1]);
	setProperty(Character_tag.. '.offset.y', offsetU[2]);



elseif direction == 3 then
	setProperty(Character_tag.. '.offset.x', offsetR[1]);
	setProperty(Character_tag.. '.offset.y', offsetR[2]);



		end
end

end

-- this is for the character to do there animation on Countdown with the actual characters
function onCountdownTick(counter)
if loopI == false then
	if counter %2 == 0 and fuck_this == true then
			objectPlayAnimation(Character_tag, 'IDLE');
			setProperty(Character_tag.. '.offset.x', offsetI[1]);
			setProperty(Character_tag.. '.offset.y', offsetI[2]);
		end
end
end

-- this is for the character to do there animation on beat
function onBeatHit()

if loopI == false then
	if curBeat % 2 == 0 and fuck_this == true then
		objectPlayAnimation(Character_tag, 'IDLE');
		setProperty(Character_tag.. '.offset.x', offsetI[1]);
		setProperty(Character_tag.. '.offset.y', offsetI[2]);

	end
fuck_this = true
end
end

function onTimerCompleted(tag)
if tag == 'play' then
loopI = false
		objectPlayAnimation(Character_tag, 'IDLE');
		setProperty(Character_tag.. '.offset.x', offsetI[1]);
		setProperty(Character_tag.. '.offset.y', offsetI[2]);
end
if tag == 'idle back' then

		objectPlayAnimation(Character_tag, 'IDLE');
		setProperty(Character_tag.. '.offset.x', offsetI[1]);
		setProperty(Character_tag.. '.offset.y', offsetI[2]);
end
end