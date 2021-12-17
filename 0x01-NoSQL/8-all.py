#!/usr/bin/env python3
"""
list all documents in a collection
"""


def list_all(mongo_collection):
    """
    return an empty list if no document in the collection
    """
    if mongo_collection.count() == 0:
        return []
    else:
        return mongo_collection.find()
