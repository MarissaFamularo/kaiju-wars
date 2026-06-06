# 🦖 Kaiju Wars

A 3D browser game where you're a giant Kaiju hero **and** a space explorer. Stomp
monsters, pilot ships, blast off in rockets, and travel the (real!) solar system: 
the Moon, Mars, Saturn's moon Titan, a faraway star system, and **Mercury**, where
you have to **program robots** to solve coding puzzles.

Built by a 7-year-old Kaiju superfan and hi mom. It's a single `index.html` file using
[Three.js](https://threejs.org/) — no build step, no framework.

## ▶️ How to play

**Easiest:** double-click **`Play Kaiju Wars.command`**. It starts a tiny local
web server (so the real planet photos load) and opens the game in your browser.
Keep the little Terminal window open while playing; close it to stop.

**Or** serve the folder any way you like, e.g.:

```bash
python3 -m http.server 8000
# then open http://localhost:8000
```

> Opening `index.html` directly with `file://` mostly works, but the planet
> textures fall back to flat colors (browsers block local images in WebGL). Use a
> local server for the full look.

### Controls
- **WASD** move · **Mouse** look · **Space** jump/boost · **Click** attack
- **1/2/3** switch character · **4/5** pilot ships · **6** astronaut (in space)
- **F** board rockets / use Robot Terminals · **J** missions · **M** map
- **B** shop · **Shift** back to main menu · **Esc** close any popup

## 🌍 Worlds & missions
Mission Control gives a quest chain through the solar system; finishing a mission
unlocks the next world. Each world has real gravity (you jump ~6× higher on the
Moon!), fun facts, side quests, and collectible ExoCrystals.

Worlds: City (Earth) · Launch Site · Deep Space · Moon · Mars · Titan (Saturn) ·
New Star System (Zora) · **Mercury** · Neon Frontier (bonus).

## 🤖 Mercury — the coding world
Mercury is too hot for people, so in real life **robots** explore it — so in the
game you **program the robots**. Walk up to a glowing Robot Terminal and press
**F** to solve a puzzle. The seven terminals each teach one computer-science idea:

| Terminal | Teaches |
| --- | --- |
| Move the Rover | Sequencing (step-by-step programs) |
| Around the Crater | Turning & planning |
| Loop Power | Loops (repeat instead of repeating yourself) |
| Fix the Bug | Debugging |
| Crack the Pattern | Patterns / sequences |
| Train the Sorting Robot | A.I. / classification from examples |
| Binary Code Lock | Binary (how computers count) |

Solving terminals completes the **Reboot the Robots** mission plus four bonus side
quests (Master Programmer, Loop Genius, Bug Squasher, A.I. Trainer). Progress
saves automatically in the browser.

## 🚀 Deploying
It's a static site, so any static host works (it's already played on Netlify at kaijuwars.netlify.app).
For continuous deploy, connect this repo to Netlify/Vercel/GitHub Pages and serve
the repo root — `index.html` is at the top level, with the `textures/` folder
beside it. The fancy glow (bloom) and CDN copy of Three.js need internet; without
it, the game still runs and degrades gracefully.

## 🛠️ Tech notes
- Single `index.html`, **Three.js r128** (from CDN). No post-r128 geometries
  (e.g. no `CapsuleGeometry`).
- Planet textures live in `textures/` and must ship alongside `index.html`.
- Progress, coins, and skins are stored in `localStorage`.
