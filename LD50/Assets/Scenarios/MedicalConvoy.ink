VAR politeness = 0
VAR karma = 0
VAR supplies = 0
VAR fuel = 0

The reports were graphic, but nothing could have prepared you for your arrival   in the system. # game
Orbiting the star are almost a dozen medical vessels, with swarms of small civilian craft surrounding them. # game
Almost blotted out completely by the armada is a small orbital refueling plant. # game
 
-> choices

=== choices
You consider your options. # game
* [Hail the medical  flagship] -> flagshipIntro
* [Dock with the refueling plant] -> refuelingPlant
* [JUMP] -> END

=== flagshipIntro ===
Almost half an hour passes before the flagship responds, and when they do get back to you it's not with an eagerness to help. # game
Emergency patients to Deck 3, everyone else will have to wait a bit longer. No, a cough isn't an emergency. # contact
-> flagship

=== flagship ===
* [Thank them and hang up] -> choices
* [Offer aid] -> aid
* [Ask where they came from] -> where

= where
So like, what's your deal? What do you do here, vibe-wise? # player
I don't have time for this, we have people fighting for their lives here. Go look us up on the extranet if you're so damn curious. "Athena Medical." -> flagship # contact 

= aid
No, sorry, I'd like to help your efforts here. Are you accepting donations? # player
Oh, you want to help? Wow, that's... actually a new one. Sad state of affairs this far out from the Core, but that's how it is. Yeah, we'll take whatever you can afford to give! # contact
* [Donate a little (-1 supplies)] -> aid1
* [Donate a lot (-5 supplies)] -> aid5

= aid1
{ supplies >= 1:
        Sending over a pallet of supplies now. Hope this helps! # player # +karma/-supplies # 1/1
        -> aidSuccess 
    - else:
        Sorry, I can't actually afford to help, nevermind. # player # -politeness # 1
        -> aidFail
 }
 
 = aid5
{ supplies >= 5:
        Sending over a few pallets of supplies now. Hope this helps! # player # +karma/-supplies # 5/5
        -> aidSuccess 
    - else:
        Sorry, I can't actually afford to help, nevermind. # player # -politeness # 1
        -> aidFail
 }

= aidSuccess
 
Thank you for your donation. Now I'm sorry, but I have to get back on the line. # contact
* [Hang up] -> choices

= aidFail
Fine, whatever. Thanks for wasting my time. # contact
* [Hang up] -> choices


=== refuelingPlant ===
Welcome to Cheap Charlie's Ol' Reliable Super-Luminal Fuel Station & Rest Stop! Warning: this station is automated. How may we serve you today? # contact
* [Refuel] -> refuel
* [Leave] -> choices

= refuel
Sorry, we're all out of fuel! # contact
So much for that idea. # game
* [Undock] -> choices
