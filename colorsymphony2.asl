/*
** Color Symphony 2 RTA
** By Lyliya
*/

state("ColorSymphony2")
{
    uint endgame : "mono.dll", 0x001F30AC, 0x94, 0xC, 0x34, 0xC, 0x24, 0xA8, 0x7BC;
    uint lvl : "mono.dll", 0x001F30AC, 0x204, 0xC, 0x1C4, 0x24, 0x4, 0x28, 0xF00;
}

init
{
	refreshRate = 30;
}

update
{
}

startup
{
    // Add all chapters
    for (int chapters = 1; chapters < 8; chapters++) {
        settings.Add("ch" + chapters, true, "Chapter " + chapters);
    }

    // Chapter 1
    for (int level = 7; level < 22; level++) {
        settings.Add("level_"+level, level == 21, "Level " + (level - 6), "ch1");
    }

    // Chapter 2
    for (int level = 23; level < 38; level++) {
        settings.Add("level_"+level, level == 37, "Level " + (level - 22), "ch2");
    }

    // Chapter 3
    for (int level = 39; level < 54; level++) {
        settings.Add("level_"+level, level == 53, "Level " + (level - 38), "ch3");
    }

    // Chapter 4
    for (int level = 55; level < 70; level++) {
        settings.Add("level_"+level, level == 69, "Level " + (level - 54), "ch4");
    }

    // Chapter 5
    for (int level = 71; level < 86; level++) {
        settings.Add("level_"+level, level == 85, "Level " + (level - 70), "ch5");
    }

    // Chapter 6
    for (int level = 87; level < 102; level++) {
        settings.Add("level_"+level, level == 101, "Level " + (level - 86), "ch6");
    }

    // Chapter 7
    for (int level = 103; level < 109; level++) {
        settings.Add("level_"+level, false, "Level " + (level - 102), "ch7");
    }
}

start
{
    if (current.lvl == 6 && old.lvl == 4) {
        return true;
    }
	// if (old.ingame == 0 && current.ingame == 1) {
    //     return true;
    // }
}

split
{

    // Check Endgame
    if (current.lvl == 110 && current.endgame == 0 && old.endgame == 1) {
        return true;
    }

    // 2 Chapter select screen

    // 7 Chapter 1 First level
    // 22 Chapter 1 Select Stage screen

    // 23 Chapter 2 First lvl
    // 38 Chapter 2 Select Stage screen

    // 39 Chapter 3 First lvl
    // 54 Chapter 3 Select Stage screen

    // 55 Chapter 4 First lvl
    // 70 Chapter 4 Select Stage screen

    // 71 Chapter 5 First lvl
    // 86 Chapter 5 Select Stage screen

    // 87 Chapter 6 First lvl
    // 102 Chapter 6 Select Stage screen

    // 103 Chapter 7 First lvl
    // 108 Chapter 7 last lvl
    // 109 Chapter 7 Select Stage screen
    if (old.lvl < current.lvl && current.lvl > 7 && current.lvl != 22 && current.lvl != 38 && current.lvl != 54 && current.lvl != 70 && current.lvl != 86 && current.lvl != 102 && current.lvl != 109) {
        return settings["level_"+old.lvl];
    }
}

reset
{
}

isLoading
{
}

gameTime {
}

shutdown {
}
