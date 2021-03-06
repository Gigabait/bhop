BHOP.Difficulties={}

function BHOP:CreateTeams()
  for i,tab in ipairs(BHOP.Difficulties)do
    team.SetUp(i, tab.name, tab.color);
  	team.SetSpawnPoint(i,{"info_player_start","info_player_terrorist","team_player_counterterrorist"})
  end
end

local i=0
local function defineDifficulty(name,timeOnBlock,killOnBlock,color,mul)
  i=i+1

  BHOP.Difficulties[i]={
    key=i,
    name=name,
    color=color,
    timeOnBlock=timeOnBlock,
    killOnBlock=killOnBlock,
    mul=mul or 1
  }
end
defineDifficulty("Practise",5,false,ES.Color.Yellow,1)
defineDifficulty("Autohop",.4,false,ES.Color.Green,1.2)
defineDifficulty("Classic",.4,false,ES.Color.Blue,1.4)
defineDifficulty("Insanity",.4,true,ES.Color.Red,1.6)

local PLAYER=FindMetaTable("Player")

local spectator={
  key=0,
  name="Spectator",
  color=ES.Color.Grey,
  timeOnBlock=0,
  killOnBlock=false,
  mul=0
}
function PLAYER:GetDifficulty()
  return BHOP.Difficulties[self:Team()] or spectator
end
