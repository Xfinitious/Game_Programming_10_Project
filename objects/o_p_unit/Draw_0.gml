//draw_self();

//draw_text(x-64,y-16,string(id)+", Attack: "+string(current[@ ATTACKPOWER])+","+string(turnFinished)+", "+string(attackWillHit));

if (drawTarget) draw_sprite(s_Targeting,0,x,y);

if (selected) draw_sprite(s_Indicator,0,x,y);

draw_text(x,y,string(team));