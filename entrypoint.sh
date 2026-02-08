#!/bin/sh
# Spaceballs quotes with random ANSI color and speaker citation

# Format: Quote text|Speaker
QUOTES="
May the Schwartz be with you.|Yogurt
I see your schwartz is as big as mine.|Dark Helmet
We ain't found shit!|Soldier
Ludicrous speed! GO!|Dark Helmet
Keep firing, assholes!|Dark Helmet
I'm surrounded by assholes!|Dark Helmet
Comb the desert!|Dark Helmet
So, Lone Starr, now you see that evil will always triumph, because good is dumb.|Dark Helmet
Yogurt! I hate Yogurt!|Dark Helmet
We are now at plaid speed!|Colonel Sandurz
Prepare ship for ludicrous speed!|Colonel Sandurz
I am your father's brother's nephew's cousin's former roommate.|Dark Helmet
What does that make us?|Lone Starr
Absolutely nothing.|Dark Helmet
Funny, she doesn't look Druish.|Barf
Merchandising! Merchandising!|Yogurt
Spaceballs the flame thrower!|Yogurt
The kids love this one.|Yogurt
If you can read this, you don't need glasses.|Opening credits
How many Assholes have we got on this ship, anyhow?|Dark Helmet
There's only one man who would dare give me the raspberry: Lone Starr!|Dark Helmet
1-2-3-4-5? That's the stupidest combination I've ever heard of in my life!|Dark Helmet
That's the kinda thing an idiot would have on his luggage!|Dark Helmet
Commence operation Vacu-Suck!|Dark Helmet
Shit! I hate it when I get my Schwartz twisted!|Dark Helmet
Even in the future nothing works!|Dark Helmet
Come back, you fat bearded bitch!|Dark Helmet
Not in here, Mister. This is a Mercedes!|Dot Matrix
It's either the 4th of July or someone's trying to kill us!|Dot Matrix
That was my virgin alarm. It's programmed to go off before you do.|Dot Matrix
Why didn't somebody tell me my ass was so big?!|President Skroob
I told you never to call me on this wall! This is an unlisted wall!|President Skroob
The ship is too big. If I walk, the movie will be over.|President Skroob
Where the hell are we, Paris?!|President Skroob
I can't make decisions! I'm a president!|President Skroob
Spaceballs? Forget it, too dangerous.|Lone Starr
We're doing it for a shitload of money!|Lone Starr
Buckle up back there, we're going into Hyperactive!|Lone Starr
You're ugly when you're angry!|Lone Starr
We've got this thing about death; it's not us.|Barf
I'm a Mawg. Half-man, half-dog. I'm my own best friend!|Barf
They've gone to plaid!|Barf
Water, my ass! Get this guy some Pepto Bismol!|Diner patron
It's my industrial-strength hair-dryer, and I can't live without it!|Princess Vespa
Where's my money?!|Pizza the Hutt
Careful, you idiot! I said across her nose, not up it!|Dark Helmet
I've lost the bleeps, I've lost the sweeps, and I've lost the creeps!|Radar Technician
The radar appears to be jammed!|Radar Technician
Ah, buckle this! Ludicrous speed! GO!|Dark Helmet
What have I done?! My brains are going into my feet!|Dark Helmet
Never underestimate the power of the Schwartz!|Yogurt
It's Megamaid! She's gone from suck to blow!|Colonel Sandurz
You idiots! You've captured their stunt doubles!|Captain of the Guard
We were told to comb the desert, so we're combing it!|Dark Helmet
God willing, we'll all meet again in Spaceballs 2: The Search for More Money.|Yogurt
I've got the same combination on my luggage!|President Skroob
Who made that man a gunner?|Dark Helmet
Suck... suck... suck!|Dark Helmet, Skroob & Sandurz
No, sir! I didn't see you playing with your dolls again!|Colonel Sandurz
We're at now, now.|Colonel Sandurz
When will then be now? Soon.|Colonel Sandurz
"

# ANSI colors: red, green, yellow, blue, magenta, cyan, bold
COLORS="31 32 33 34 35 36 1"

quote_list=$(echo "$QUOTES" | sed '/^[[:space:]]*$/d' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
nq=$(echo "$quote_list" | wc -l)
nc=$(echo "$COLORS" | wc -w)

# Default: one quote and exit. Set LOOP=1 to keep printing every INTERVAL seconds.
loop=${LOOP:-0}
while true; do
  rq=$(( RANDOM % nq + 1 ))
  rc=$(( RANDOM % nc + 1 ))
  line=$(echo "$quote_list" | sed -n "${rq}p")
  quote="${line%|*}"
  speaker="${line#*|}"
  color=$(echo "$COLORS" | cut -d' ' -f"$rc")
  printf "\n\033[%sm%s\033[0m\n" "$color" "$quote"
  printf "\033[2m— %s\033[0m\n\n" "$speaker"
  [ "$loop" != "1" ] && exit 0
  sleep "${INTERVAL:-3}"
done
