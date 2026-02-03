# SCSI AI Server

This server runs YOLOv8x (largest model) for maximum accuracy and exposes a single endpoint the app calls.

## Setup

```bash
cd ai_server
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Run (Local)

```bash
uvicorn main:app --host 0.0.0.0 --port 8000
```

The app expects:
- `POST /detect`
- Multipart form field: `image`
- Response: JSON with `detections` list

Each detection item:

```
{
  "category": "person|vehicle|unknown",
  "label": "coco_label",
  "confidence": 0.93,
  "bbox": [x1, y1, x2, y2],
  "normalized": true
}
```

## Notes

- For weapons/drugs/documents, replace `yolov8x.pt` with a custom fine-tuned model and update `map_category`.
- If running on an Android emulator, set the app AI base URL to `http://10.0.2.2:8000`.
- If running on a device, use your machine's LAN IP (e.g. `http://192.168.1.10:8000`).

## Deploy to Render

From repo root:

```bash
render blueprint apply ai_server/render.yaml
```

Or create a new Web Service in Render with:
- Build: `pip install -r requirements.txt`
- Start: `uvicorn main:app --host 0.0.0.0 --port 8000`

After deploy, set the app AI base URL to your Render service URL.
