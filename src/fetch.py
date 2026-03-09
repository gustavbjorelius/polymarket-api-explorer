#!/usr/bin/env python3
""" Day 1: Fetch Polymarket active markets."""
# documentation at https://docs.polymarket.com

import requests
import json

URL = "https://gamma-api.polymarket.com/markets?active=true&closed=false&limit=50" 

def fetch_markets():
    """GET active markets, return JSON."""
    try:
        response = requests.get(URL, timeout=10)
        response.raise_for_status()
        data = response.json()
        return data
    except requests.exceptions.RequestError as e:
        print(f"Error: {e}")
        return None

def print_markets(data):
    """Print first 5 markets."""
    if not data:
        print("No data")
        return
    
    markets = data # .get("data", [])
    print(f"Found {len(markets)} markets\n")

    for i, market in enumerate(markets[:100]):
        if market["closed"]:
            continue 
        question = market.get("question", "N/A")
        price = market["lastTradePrice"]
        print(f"{i+1}. {question}")
        print(f"    Price: {price}\n")

if __name__ == "__main__":
    data = fetch_markets()
    print_markets(data)
