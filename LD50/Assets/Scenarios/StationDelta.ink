VAR politeness = 0
VAR karma = 0
VAR supplies = 0
VAR fuel = 0

Mere seconds after decelerating to a sub-light speed, you are hailed by a nearby space station. #game
* [Answer the hail] -> answer
* [Ignore the hail] -> ignore

=== answer ===
Attention unknown vessel, this is Captain Stone of Station Delta. # contact
Please state your name and intentions or we will be forced to take defensive actions. # contact
* [We come in peace] -> answerPeace

=== answerPeace ===
Station Delta, this is the captain of the <i>Hermes</i>. We come in peace. We are just passing through this system. # player # +politeness # 3
Affirmative, <i>Hermes</i>. Sorry about the welcome, but you can't be too careful these days. Godspeed and safe voyages. # contact
* [JUMP] -> END

=== ignore ===
You ignore their hails and carry on uninterrupted. You had almost forgotten you had even been hailed when your ship's propulsion system goes offline. You are once again hailed by the space station. # player
* [Answer the hail] -> answerLate
* [Ignore the hail again] -> ignoreAgain
* [Respond with a computer virus] -> hack

=== answerLate ===
Unknown vessel, you have 30 seconds to identify yourself and state your intentions before we open fire. # contact
Your sensors show the station's defenses powering up, and your shields are no match for them. Ignoring the station further is not a viable option. # game
* [Identify yourself] -> identify
* [Respond with a computer virus] -> hack

=== hack ===
UPLOADING TROJAN_HORSE v1.53... # hack
UPLOADING... # hack
UPLOADING... # hack
UPLOADING... # hack
UPLOAD COMPLETE. # hack
Milliseconds after the upload finishes, the visual of the station is replaced by a sudden flash of light. All transmissions from the station cease. # game # -karma # 10
* [JUMP] -> END

=== ignoreAgain ===
You once again ignore the hails, and as could have been predicted, around half a minute later you are rewarded with a targeted shot to your life support systems. There's no time to repair it now! You have to get out of here.
* [JUMP] -> END

=== identify ===
This is the <i>Hermes</i>, an Icarus-class civilian transport vessel.
* [Blame the delay in responding on tech problems] -> blame
* [Apologise for the delay] -> apologise

=== blame ===
Sorry for the delay, we've been having some technical issues coming out of FTL. Sudden evacuation doesn't leave much time for troubleshooting. -> acknowledged # -politeness # 1

=== apologise ===
Our sincere apologies, <i>Delta</i>, hope all is okay on your end. -> acknowledged # +politeness # 1

=== acknowledged ===
Acknowledged, <i>Hermes</i>. You're clear to continue onward. Godspeed.
* [JUMP] -> END