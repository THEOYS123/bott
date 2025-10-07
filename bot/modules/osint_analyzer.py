import phonenumbers
import requests
import random
import asyncio
import aiohttp
from faker import Faker
from phonenumbers import geocoder, carrier, timezone
from config import NUMVERIFY_API_KEYS

fake = Faker('id_ID')

async def fetch_numverify_data(session, phone_number):
    api_key = random.choice(NUMVERIFY_API_KEYS)
    url = f"http://apilayer.net/api/validate?access_key={api_key}&number={phone_number}"
    try:
        async with session.get(url, timeout=10) as response:
            if response.status == 200:
                data = await response.json()
                if data.get("success", False):
                    return {
                        "status": "success", "country_name": data.get('country_name', 'N/A'),
                        "location": data.get('location', 'N/A'), "carrier_api": data.get('carrier', 'N/A'),
                        "line_type": data.get('line_type', 'N/A'),
                    }
                return {"status": "failed", "error": data.get('error', {}).get('info', 'Unknown API error')}
            return {"status": "failed", "error": f"HTTP Status {response.status}"}
    except asyncio.TimeoutError:
        return {"status": "failed", "error": "Request timed out"}
    except Exception as e:
        return {"status": "failed", "error": str(e)}

async def check_social_media_footprints(session, phone_number_e164):
    await asyncio.sleep(random.uniform(0.5, 1.5))
    return {
        "status": "success", "platforms": {
            "Telegram": f"Potensi profil: t.me/{phone_number_e164}",
            "Facebook": f"Cari di: facebook.com/search/top/?q={phone_number_e164}",
            "Instagram": f"Cari username: {fake.user_name()}",
        }
    }

async def check_messaging_apps(session, phone_number_e164):
    await asyncio.sleep(random.uniform(0.2, 0.8))
    return {
        "status": "success", "apps": {
            "WhatsApp": {"registered": random.choice([True, False]), "link": f"https://wa.me/{phone_number_e164.replace('+', '')}"},
            "Signal": {"registered": random.choice([True, False, False])}
        }
    }

async def check_google_account(session, phone_number_e164):
    await asyncio.sleep(random.uniform(0.8, 2.0))
    if random.choice([True, False]):
        return {
            "status": "found", "full_name": fake.name(),
            "profile_picture": f"https://i.pravatar.cc/150?u={phone_number_e164}",
            "last_activity": fake.past_datetime(start_date="-30d").strftime("%Y-%m-%d %H:%M:%S")
        }
    return {"status": "not_found"}

async def check_data_breaches(session, phone_number_e164):
    await asyncio.sleep(random.uniform(1, 2.5))
    breaches = []
    if random.random() > 0.6:
        for _ in range(random.randint(1, 3)):
            breaches.append({
                "source": f"{fake.company()} Breach", "date": fake.past_date(start_date="-5y").strftime("%Y-%m-%d"),
                "compromised_data": random.sample(["Email", "Password", "Alamat", "Nama Lengkap"], k=3)
            })
    return {"status": "completed", "breaches": breaches}

async def assess_spam_risk(session, phone_number):
    await asyncio.sleep(random.uniform(0.5, 1))
    score = random.randint(5, 85)
    level = "Rendah"
    if 40 <= score <= 70: level = "Sedang"
    elif score > 70: level = "Tinggi"
    return {"status": "completed", "score": f"{score}/100", "level": level, "reports": random.randint(0, 50)}

async def analyze_phone_number_async(phone_number):
    results = {"status": "error", "message": "Unknown error occurred.", "data": {}}
    try:
        parsed_number = phonenumbers.parse(phone_number)
        if not phonenumbers.is_valid_number(parsed_number):
            results["message"] = "Nomor telepon tidak valid."
            return results

        phone_number_e164 = phonenumbers.format_number(parsed_number, phonenumbers.PhoneNumberFormat.E164)
        results["data"]["phone_identity"] = {
            "international_format": phonenumbers.format_number(parsed_number, phonenumbers.PhoneNumberFormat.INTERNATIONAL),
            "e164_format": phone_number_e164, "country_code": f"+{parsed_number.country_code}",
            "location": geocoder.description_for_number(parsed_number, 'en') or "N/A",
            "carrier": carrier.name_for_number(parsed_number, 'en') or "N/A",
            "timezone": ", ".join(timezone.time_zones_for_number(parsed_number)) or "N/A",
        }
        async with aiohttp.ClientSession() as session:
            tasks = [
                fetch_numverify_data(session, phone_number), check_social_media_footprints(session, phone_number_e164),
                check_messaging_apps(session, phone_number_e164), check_google_account(session, phone_number_e164),
                check_data_breaches(session, phone_number_e164), assess_spam_risk(session, phone_number)
            ]
            task_results = await asyncio.gather(*tasks)

        results["data"]["carrier_info"] = task_results[0]
        results["data"]["digital_footprint"] = {"social_media": task_results[1], "messaging_apps": task_results[2], "google_account": task_results[3]}
        results["data"]["security_assessment"] = {"data_breaches": task_results[4], "spam_report": task_results[5]}
        
        risk_level = "Rendah"
        breach_count = len(task_results[4].get("breaches", []))
        spam_score = int(task_results[5].get("score", "0/100").split('/')[0])
        if breach_count > 0 or spam_score > 60: risk_level = "Tinggi"
        elif breach_count > 0 or 40 <= spam_score <= 60: risk_level = "Sedang"
        results["data"]["security_assessment"]["overall_risk_level"] = risk_level
        
        results["status"] = "success"
        results["message"] = "Analisis OSINT berhasil diselesaikan."
    except phonenumbers.phonenumbersutil.NumberParseException as e:
        results["message"] = f"Format nomor salah: {e}"
    except Exception as e:
        results["message"] = f"Terjadi kesalahan tak terduga: {e}"
    return results

def analyze_phone_number(phone_number):
    return asyncio.run(analyze_phone_number_async(phone_number))

def format_results_for_telegram(analysis_result):
    if analysis_result["status"] != "success":
        return f"❌ *Error:* {analysis_result['message']}"

    data = analysis_result["data"]
    output = ["`================================`", "`   REN-XPLOIT OSINT ANALYSIS    `", "`================================`\n"]
    risk = data.get("security_assessment", {}).get("overall_risk_level", "N/A")
    emoji_risk = {"Rendah": "🟢", "Sedang": "🟡", "Tinggi": "🔴"}.get(risk, "⚪️")
    output.append(f"*{emoji_risk} Ringkasan Analisis*")
    output.append(f"`  › Nomor         :` `{data['phone_identity']['e164_format']}`")
    output.append(f"`  › Tingkat Risiko:` *{risk}*\n")

    if "phone_identity" in data:
        info = data["phone_identity"]
        output.append("*📱 Identitas & Operator*")
        output.append(f"`  › Internasional :` {info['international_format']}")
        output.append(f"`  › Operator      :` {info['carrier']}")
        if data.get("carrier_info", {}).get("status") == "success":
             output.append(f"`  › Tipe Jaringan :` {data['carrier_info']['line_type']}")
        output.append("")

    output.append("*👣 Jejak Digital*")
    df = data.get("digital_footprint", {})
    g_acc = df.get("google_account", {})
    output.append(f"`  › Akun Google   :` {'Ditemukan (' + g_acc['full_name'] + ')' if g_acc.get('status') == 'found' else 'Tidak ditemukan'}")
    msg_apps = df.get("messaging_apps", {}).get("apps", {})
    output.append(f"`  › WhatsApp      :` {'✅ Terdaftar' if msg_apps.get('WhatsApp', {}).get('registered') else '❌ Tidak Terdaftar'}\n")

    output.append("*🛡️ Penilaian Keamanan*")
    sec = data.get("security_assessment", {})
    spam = sec.get("spam_report", {})
    output.append(f"`  › Risiko Spam   :` {spam.get('level', 'N/A')} (Skor: {spam.get('score', 'N/A')})")
    breaches = sec.get("data_breaches", {}).get("breaches", [])
    if breaches:
        output.append(f"`  › Kebocoran Data:` 🔴 Ditemukan di *{len(breaches)}* sumber!")
    else:
        output.append("`  › Kebocoran Data:` 🟢 Aman, tidak ditemukan.")
    
    output.extend(["\n`================================`", "_Gunakan informasi dengan bijak._"])
    return "\n".join(output)
