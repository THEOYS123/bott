import os

TOKEN_FILE = "bot_token.txt"

def get_bot_token():
    if os.path.exists(TOKEN_FILE):
        with open(TOKEN_FILE, "r") as f:
            token = f.read().strip()
            if token:
                return token
    return 'GANTI_DENGAN_TOKEN_BOT_TELE_KALIAN'

def save_bot_token(new_token):
    with open(TOKEN_FILE, "w") as f:
        f.write(new_token)

BOT_TOKEN = get_bot_token()
NUMVERIFY_API_KEYS = [
    "7769eb81d39a3ad2cc30572596342afa",
    "a1d8ca3c5249dfee6f4f011cbd8fb3cd",
    "6fa5719f09f37d0df34a08ee1ea5776b",
    "f91e593522b3472e5f28c45a2f981602"
]

FLASK_HOST = '0.0.0.0'
FLASK_PORT = 2025 # ini lu ganti aja gpp
FLASK_DEBUG = True
