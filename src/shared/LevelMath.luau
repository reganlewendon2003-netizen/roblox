--!strict
-- Pure levelling maths for the Act Chat MMORPG prototype.
-- This module does not grant XP, modify players or save data.

local LevelMath = {}

local BASE_XP = 100
local XP_STEP = 25

function LevelMath.requiredXPForNextLevel(level: number): number
    assert(level >= 1 and level % 1 == 0, "level must be a positive integer")
    return BASE_XP + (level - 1) * XP_STEP
end

function LevelMath.progressFromTotalXP(totalXP: number): (number, number, number)
    assert(totalXP >= 0 and totalXP < math.huge, "totalXP must be a finite nonnegative number")

    local level = 1
    local currentXP = math.floor(totalXP)
    local nextLevelXP = LevelMath.requiredXPForNextLevel(level)

    while currentXP >= nextLevelXP do
        currentXP -= nextLevelXP
        level += 1
        nextLevelXP = LevelMath.requiredXPForNextLevel(level)
    end

    return level, currentXP, nextLevelXP
end

return LevelMath
