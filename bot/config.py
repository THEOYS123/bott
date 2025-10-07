import os

# --- Telegram Bot Configuration ---
TOKEN_FILE = "bot_token.txt"

def get_bot_token():
    """Membaca token dari file atau menggunakan token default."""
    if os.path.exists(TOKEN_FILE):
        with open(TOKEN_FILE, "r") as f:
            token = f.read().strip()
            if token:
                return token
    # Ganti dengan token default Anda jika file tidak ada atau kosong
    return '8187781938:AAGs_fEr5Q-qJFQEq98aj1E-ncOUo1SPS14'

def save_bot_token(new_token):
    """Menyimpan token baru ke dalam file."""
    with open(TOKEN_FILE, "w") as f:
        f.write(new_token)

BOT_TOKEN = get_bot_token()

# --- OSINT API Configuration ---
# Simpan API keys di sini agar mudah diganti atau ditambah
NUMVERIFY_API_KEYS = [
    "7769eb81d39a3ad2cc30572596342afa",
    "a1d8ca3c5249dfee6f4f011cbd8fb3cd",
    "6fa5719f09f37d0df34a08ee1ea5776b",
    "f91e593522b3472e5f28c45a2f981602"
]

# --- Web Server Configuration ---
FLASK_HOST = '0.0.0.0'
FLASK_PORT = 2025
FLASK_DEBUG = True
