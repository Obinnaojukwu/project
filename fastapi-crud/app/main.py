from fastapi import FastAPI
from app.api.v1.endpoints import items

app = FastAPI()

app.include_router(items.router, prefix="/api/v1")
