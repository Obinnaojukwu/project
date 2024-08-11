

from sqlalchemy.orm import Session
from app.models import Item as DBItem
from app.schemas import ItemCreate

def create_item(db: Session, item: ItemCreate):
    db_item = DBItem(**item.dict())
    db.add(db_item)
    db.commit()
    db.refresh(db_item)
    return db_item

def get_item(db: Session, item_id: int):
    return db.query(DBItem).filter(DBItem.id == item_id).first()

