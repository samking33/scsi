from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import Response
from io import BytesIO
from PIL import Image, ImageDraw, ImageFont
import os
import torch
from ultralytics import YOLO

app = FastAPI(title="SCSI AI Server")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Render free plan memory is tight. Default to a smaller CPU model unless overridden.
MODEL_NAME = os.getenv("YOLO_MODEL", "yolov8s.pt")
torch.set_num_threads(1)
model = YOLO(MODEL_NAME)

VEHICLE_CLASSES = {
    "bicycle",
    "car",
    "motorcycle",
    "bus",
    "truck",
}


def map_category(label: str) -> str:
    label = label.lower()
    if label == "person":
        return "person"
    if label in VEHICLE_CLASSES:
        return "vehicle"
    return "unknown"


def run_detection(image: Image.Image):
    results = model(image, verbose=False, device="cpu")[0]
    return results


def serialize_detections(results, width: int, height: int):
    detections = []
    for box, cls_idx, conf in zip(
        results.boxes.xyxy.tolist(),
        results.boxes.cls.tolist(),
        results.boxes.conf.tolist(),
    ):
        x1, y1, x2, y2 = box
        label = results.names[int(cls_idx)]
        detections.append(
            {
                "category": map_category(label),
                "label": label,
                "confidence": float(conf),
                "bbox": [
                    x1 / width,
                    y1 / height,
                    x2 / width,
                    y2 / height,
                ],
                "normalized": True,
            }
        )
    return detections


@app.post("/detect")
async def detect(image: UploadFile = File(...)):
    payload = await image.read()
    img = Image.open(BytesIO(payload)).convert("RGB")
    width, height = img.size

    results = run_detection(img)
    detections = serialize_detections(results, width, height)
    return {"detections": detections}


@app.post("/detect-annotated")
async def detect_annotated(image: UploadFile = File(...)):
    payload = await image.read()
    img = Image.open(BytesIO(payload)).convert("RGB")
    width, height = img.size

    results = run_detection(img)
    draw = ImageDraw.Draw(img)

    for box, cls_idx, conf in zip(
        results.boxes.xyxy.tolist(),
        results.boxes.cls.tolist(),
        results.boxes.conf.tolist(),
    ):
        x1, y1, x2, y2 = box
        label = results.names[int(cls_idx)]
        text = f"{label} {conf:.2f}"
        draw.rectangle([x1, y1, x2, y2], outline=(255, 0, 0), width=3)
        draw.text((x1 + 4, max(0, y1 - 14)), text, fill=(255, 0, 0))

    out = BytesIO()
    img.save(out, format="JPEG", quality=90)
    return Response(content=out.getvalue(), media_type="image/jpeg")
