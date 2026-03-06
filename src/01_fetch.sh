#!/usr/bin/env python3
""" Day 1: Fetch Polymarket active markets."""

import requests
import json

URL = "https://api.polymarket.com/markets/active"

def fetch_markets():
	"""GET active markets, return JSON."""
	try:
		response = requests.get(URL, timeout=10)
		response.raise_for_status()
		data = response.json()
		return data
	except requests.RequestedError as e:
		print(f"Error: {e}")
		return None

def print_markets(data):
	"""Print first 5 markets."""
	if not data:
		print("No data")
		return
	
	markets = data.get("markets", [])
	print(f"Found {len(markets)} markets\n")

	for i, market in enumerate(markets[:5]):
		question = market.get("question", "N/A")
		price = market.get("bestBid", "N/A")
		print(f"{i+1}. {question}")
		print(f"    Price: {price}\n")

if __name__ == "__main__":
	data = fetch_markets()
	print_market(data)
