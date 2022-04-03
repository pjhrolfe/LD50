VAR politeness = 0
VAR karma = 0
VAR supplies = 0
VAR fuel = 0

You made it. The Galactic Rim. # game
And you weren't the only one. There must be tens of thousands of vessels here. # game
But why aren't they moving? # game
* [Hail a nearby vessel] -> hail1

=== hail1 ===
Attention nearby vessel, this is the <i>Hermes</i>. Do you read me? # player
No response. # game
* [Hail another ship] -> hail2

=== hail2 ===
Hello, this is the <i>Hermes</i>. Do you read me? # player
No response. # game
* [Hail another ship] -> hail3

=== hail3 ===
Hello? Is anybody out there? # player
<i>Hermes</i>, this is the <i>Boundless Abyss</i>. Did you just get here? # contact
* [Yes] -> yes

=== yes ===
Yeah, we arrived a few minutes ago. Why isn't anyone moving? Don't they know what's coming? # player
No, they know. Tell me... how much do you know about the Galactic Rim?  #contact
Not much, just that we're at the edge of our galaxy, right? # player
Precisely. Now, can you name a single time anyone's every successfully left the galaxy? # contact
* [No...] -> no

=== no ===
No, come to think about that, I can't. Why? # player
Oh my god, you really don't get it, do you? # contact
Nobody's moving, because there isn't anywhere left to go. # contact
This is it. # contact
The end of the line. # contact
Last I heard, we have a few minutes left, tops. # contact
* [Ah...] -> ah 

=== ah ===
Ah. That doesn't sound too great. # player
Now you're getting it. # contact
Listen, it's not <i>all</i> bad. # contact
Few scientists I was talking to earlier told me that by making it this far, we've managed to outlive over 99.9% of humanity. # contact
Not many people can say that. # contact
And besides, what's the point in surviving after something like this? # contact
* [Survival is the reward] -> disagree
* [I guess you're right] -> agree

=== disagree ===
The point is being around long enough to think of the point, no? # player
Isn't this very conversation a victory in and of itself? # player
You got a funny idea of victory. # contact
Yeah, I guess I do. # player
* [How long now?] -> howLong

=== agree ===
I guess you're right. # player
I wish I wasn't. # contact
* [How long now?] -> howLong

=== howLong ===
How long do we have? # player
Seconds. # contact
It's time, <i>Hermes</i>. Godspeed and goodnight. # contact
* [Godspeed, <i>Boundless Abyss</i>.] -> END
