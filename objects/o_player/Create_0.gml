event_inherited();

unitSequence = layer_sequence_create("Sequences",x,y,s_Player);

idleStart = 0;
idleEnd = 29;

attackStart = 30;
attackEnd = 73;

missStart = 74;
missEnd = 83;

hurtStart = 84;
hurtEnd = 93;

toDefendStart = 94;
toDefendEnd = 107;

defendStart = 108;
defendEnd = 115;

deathStart = 116;
deathEnd = 163;

skillStart = 164;
skillEnd = 207;

learnedSkill[0] = global.skill[skill.slash];
learnedSkill[1] = global.skill[skill.multiSlash]