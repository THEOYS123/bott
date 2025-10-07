from modules.osint_analyzer import analyze_phone_number, format_results_for_telegram

def register_handlers(bot):
    @bot.message_handler(commands=['start', 'help'])
    def send_welcome(message):
        welcome_text = (
            "🚀 *Selamat Datang di REN-XPLOIT OSINT Bot!*\n\n"
            "Bot ini dirancang untuk melakukan analisis mendalam pada nomor telepon.\n\n"
            "Gunakan perintah berikut:\n"
            "`/osint <nomor_telepon>`\n\n"
            "*Contoh:* `/osint +6281234567890`\n\n"
            "Untuk kontrol penuh, kunjungi web dashboard kami!"
        )
        bot.reply_to(message, welcome_text, parse_mode='Markdown')

    @bot.message_handler(commands=['osint'])
    def handle_osint(message):
        args = message.text.split()
        if len(args) < 2:
            bot.reply_to(message, "⚠️ *Format Salah!*\nSertakan nomor telepon setelah perintah.\n*Contoh:* `/osint +6281234567890`", parse_mode='Markdown')
            return

        phone_number = args[1]
        
        processing_msg = bot.reply_to(message, "⏳ *Menganalisis...* Mohon tunggu, data sedang dikumpulkan dari berbagai sumber.", parse_mode='Markdown')

        analysis_result = analyze_phone_number(phone_number)
        formatted_result = format_results_for_telegram(analysis_result)
        
        bot.edit_message_text(chat_id=message.chat.id, message_id=processing_msg.message_id, text=formatted_result, parse_mode='Markdown')

