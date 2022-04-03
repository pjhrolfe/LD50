VAR politeness = 0
VAR karma = 0
VAR supplies = 0
VAR fuel = 0

Alarms ring throughout your ship as soon as you drop to sub-FTL speeds. You are surrrounded by a small fleet of military vessels. # game
Let's make this simple. Send us over supplies, or we open fire. And don't even think about trying to take us down: we have hundreds of civilians on board. # contact
Space bandits with human shields. Wonderful. -> choices # game

=== choices ===
* [Send supplies] -> send
* [Send disguised bomb] -> bomb
* [Hack their systems] -> hack

=== send ===
{ supplies >= 1:
       Understood, now please let us move onward. # player # -supplies # 1
        -> sendSuccess
    - else:
        We don't have anything to give! # player
        You think we haven't heard that one before? Hurry up, or else. # contact
        -> choices
 }

=== bomb ===
Supplies recieved, <i>Hermes</i>. Pleas- *bzzt* # contact
ERROR: TRANSMISSION UNAVAILABLE -> explosion # hack

=== hack ===
UPLOADING TROJAN_HORSE v1.53... # hack
UPLOADING... # hack
UPLOADING... # hack
UPLOADING... # hack
UPLOAD COMPLETE. # hack
root@zephyr.mil:$ DISABLE WEAPONS # hack
What's happening? # contact
What did you do? # contact
Give us control back, damn it! # contact
You've successfully taken control of their systems. What now? -> hackChoices

=== hackChoices ===
* [Demand supplies] -> demand
* [Remotely detonate their engine cores] -> detonate
* [JUMP] -> END

=== hackWithoutDemandChoices ===
* [Remotely detonate their engine cores] -> detonate
* [JUMP] -> END


=== demand ===
Do you want to continue your pathetic excuse for a life? # player
If you do, transfer over whatever you've gotten from this scam. Or else. # player
Okay, okay, we're doing it! # contact # +supplies # 10
SUPPLIES RECIEVED (x10) -> hackWithoutDemandChoices # hack
You still control their systems. -> hackWithoutDemandChoices

=== detonate ===
UPLOADING DETONATION CODE... # hack
UPLOADING... # hack
UPLOADING... # hack
UPLOADING... # hack
UPLOAD COMPLETE. 
This cyber-ops package is really paying for itself. -> explosion # hack

=== explosion ===
What follows is vaguely similiar to a New Years Eve firework show, albeit with a slightly darker tone. # game
Nobody remains to recount this encounter but you. # game # -karma # 5
* [JUMP] -> END

=== sendSuccess ===
Supplies recieved, <i>Hermes</i>. Pleasure doing... well, it's hardly business, but it's been a pleasure. # contact
CHANNEL CLOSED # hack
You made it out of that situation okay, but lost some supplies. # game
Better get out of here before they ask for more. # game
* [JUMP] -> END
