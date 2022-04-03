VAR politeness = 0
VAR karma = 0
VAR supplies = 0
VAR fuel = 0

At first, you think your viewscreen is broken. But no, it's accurate: there are thousands of ships. # game
Large, small, military, civilian... it seems like humanity has put every space-faring scrapheap it has ever made into the evacuation effort. # game
Because of this, the airwaves are congested; it's hard to make out a single signal. Eventually though you locate a fellow Union ship, the first you've encountered since the evacuation.
* [Hail the Union ship] -> hail
* [JUMP] -> END

=== hail ===
The value of news on the phonenomenon that's made hundreds of stars go nova is higher than the potential downside from hailing the ship. # game
USS Portobello, this is the <i>Hermes</i>. Do you require any assistance? # player
<i>Hermes</i>, we are functioning adequately at present. It's good to hear from you, though. # contact
You're only the second Union vessel we've encountered since leaving Sol. # contact
* [How did you make it out?] -> timing # player

=== timing ===
How did you make it out? # player
The short answer: damn good timing. We were already leaving the system when the phonenomenon hit. By the time we realised what was happening it was already too late to help any of them. # contact
This has been nice, but we've got to get going. Science Division tells me that we have about sixteen hours before this one goes nova too. # contact
* [Wait, what?] -> what # player
* [JUMP] -> END

=== what ===
Wait, what? # player
Oh... you haven't heard yet, have you? # contact
The phonenomenon, it's not slowing down. In fact, the opposite. # contact
If you're not already on your way to the galactic rim... # contact
Godspeed, <i>Hermes</i>. # contact
Well, that doesn't sound too good. # game
* [JUMP] -> END