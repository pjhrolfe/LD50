VAR politeness = 0
VAR karma = 0
VAR supplies = 0
VAR fuel = 0

The system is quiet. Eerily quiet. # game
Six months ago this was the hub of a trade network that spanned a galatic arm; now you can barely make out lights on the nearby settled world. # game 
The usual thrum of signals and data traffic has been replaced with just a single low-power distress signal from a small civilian craft. -> choices # game

=== choices ===
* [Hail the vessel] -> hail
* [Covertly scan the vessel] -> scan

=== hail ===
SS <i>Arlington</i>, this is the <i>Hermes</i>. Do you require any assistance? # player
Greetings, <i>Hermes</i>! Thank god you're here, we've been stranded in this system for days! # contact
Our engine has broken down and we have no way of fixing it. Would we able to hitch a ride with you to the next system over? # contact
* [Prepare to dock] -> dock
* [Decline] -> decline

=== dock ===
Acknowledged, <i>Arlington</i>. On our way to dock now. # player
You decelerate as you approach the vessel until you are near-stationary around 500m away. # game
Through your passive scanner you notice that the life support is off. # game
There is nobody alive onboard that vessel. #game
Whatever's going on with the ship, it's not your problem. # game
* [JUMP] -> END


=== scan ===
LOCATING VESSEL... # hack
LOCATING... # hack
LOCATING... # hack
LOCATING... # hack
VESSEL LOCATED # hack
SCANNING VESSEL... # hack
NAME: SS ARLINGTON # hack
CAPACITY: 16 # hack
WARNING: INTRUSION DETECTED # hack # -politeness # 1
* [Continue scanning] -> scanContinue
* [Stop scanning] -> scanStop

= scanContinue
HIDDEN PROTOCOL FOUND # hack
NAME: RUBICON PROTOCOL # hack
512-BIT ENCRYPTION DETECTED # hack
DECRYPTING... # hack
DECRYPTING... # hack
DECRYPTING... # hack
FILE DECRYPTED. # hack
What you see shocks you: the vessel is secretly fitted with a small nuclear device. From what you can divine from the decrypted file, it's been set to detonate when another ship approaches it. # game
* [Hail the ship] -> hail_scanContinue
* [Remotely detonate the nuclear device] -> remoteDetonate

== hail_scanContinue
Alarmed by the implications of what you have discovered, you hail the ship. # game
SS <i>Arlington</i>, this is the <i>Hermes</i>. Do you require any assistance? # player
Greetings, <i>Hermes</i>! Thank god you're here, we've been stranded in this system for days! Our engine has broken down and we have no way of fixing it. Would we able to hitch a ride with you to the next system over? # contact
The voice of the <i>Arlington</i> sounds crackly and artifical, but that could be an artifact of the transmission.
* [Prepare to dock] -> dock
* [Remotely detonate the nuclear device] -> remoteDetonate
* [Decline] -> decline

== remoteDetonate
UPLOADING DETONATION CODE... # hack
UPLOADING... # hack
UPLOADING... # hack
UPLOADING... # hack
UPLOAD COMPLETE. # hack
Milliseconds after the upload finishes, the image of the ship is replaced by a sudden flash of light. The vessel's signal ceases abruptly. # game # +karma # 3
You wonder what on Earth the creator of the ship was thinking. If a civilian had stumbled across that... # game
You prepare to leave the system. # game
* [JUMP] -> END

=== scanStop ===
You stop the scan; after all, it's rude to poke through someone else's systems. And they seem harmless enough. # game
* [Hail the vessel] -> hail

=== decline ===
Apologies, <i>Arlington</i>, that isn't something we're able to accomodate. # player
The <i>Arlington</i> doesn't respond. Instead, it begins to accelerate... toward your vessel. Their engine seems to be working just fine. Time to get out of here! # game
* [JUMP] -> END