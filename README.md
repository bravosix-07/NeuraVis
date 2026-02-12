# 🧠⚡ NeuraVis

### NeuraVis is a neural visualization engine that turns ideas into motion.



- This engine converts plain-language prompts into Manim animations using an **LLM-driven code generation pipeline**, then executes Manim to render MP4 videos and persists metadata and assets to cloud storage.


-----



### 🧩 Working architecture (compact)

```

Text Prompt
     ↓
LLM Reasoning
     ↓
Scene Planning
     ↓
Manim Code Generation
     ↓
Render Pipeline
     ↓
Encoded Video Output

```


-------


### ⚙ Pipeline

Prompt → Semantic parse → Scene plan → Manim.py → Headless render → FFmpeg → MP4 → (store → deliver)



--------


### 🔧 Core tech 

**LLM orchestration**: LangChain patterns + OpenAI / Google GenAI adapters

**Animation**: Manim (programmatic scenes) + FFmpeg (encode)

**API / Orchestration**: FastAPI (Python)

**Persistence** : Supabase (Postgres + Storage)

**UI**: Next.js (React, TypeScript, CSS)

**Containerization** : Docker



-----



### 📂 Repo layout (short)

```

NeuraVis/
├─ Backend/         # FastAPI, Model layer (LLM → code), auth, DB config
│  ├─ Model/        # prompt→plan→code synthesis
│  ├─ auth/         # JWT & auth routes
│  ├─ main.py
│  └─ requirements.txt
├─ frontend/        # Next.js UI (prompt, preview, auth)
├─ animations/      # generated .py scene artifacts
├─ media/           # rendered MP4s
├─ Dockerfile
├─ docker-compose.yml
└─ .env.example

```


----




### ▶️ Quick start — local (dev)



#### Backend

```
cd Backend
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python main.py         
```

#### Frontend (dev)

```
cd ../frontend
npm install
npm run dev
```



### ▶️ Quick start — Docker

```
# from repo root
docker compose up --build
# Backend exposed on :8000 by default
```


-----


### ✅ Minimal smoke test

Start services.

``` GET http://localhost:8000/health (or root). ```

POST a tiny prompt to the generate endpoint → confirm .py in animations/ and .mp4 in media/.


----- 


### 🚀 Future Roadmap

- TTS / voiceover per scene (synchronized)

- Preset visual styles (whiteboard, cinematic, sketch)

- Low-res realtime preview for iteration speed

- GPU render pool for scale (optional CUDA workers)

