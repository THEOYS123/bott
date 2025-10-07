import threading
import telebot
from flask import Flask
import logging
import config
from web.routes import web_bp
from bot.handlers import register_handlers

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
log = logging.getLogger(__name__)

app = Flask(__name__)
app.secret_key = 'super-secret-key-for-flash-messages'

bot = telebot.TeleBot(config.BOT_TOKEN, threaded=False)

class BotThread(threading.Thread):
    def __init__(self, bot_instance):
        super().__init__()
        self.bot = bot_instance
        self.daemon = True
        self._is_running = True

    def run(self):
        log.info("Starting Telegram bot polling...")
        try:
            self.bot.infinity_polling(skip_pending=True)
        except Exception as e:
            log.error(f"An error occurred in bot polling: {e}")
        log.info("Bot polling stopped.")

    def stop(self):
        log.info("Stopping bot polling...")
        self.bot.stop_polling()
        self._is_running = False

bot_polling_thread = None

def get_bot_status():
    """Checks if the bot thread is alive and running."""
    return bot_polling_thread and bot_polling_thread.is_alive()

app.register_blueprint(web_bp)
register_handlers(bot)

@app.context_processor
def inject_bot_status():
    return dict(get_bot_status=get_bot_status)

if __name__ == '__main__':
    log.info("Starting REN-XPLOIT application...") 
    bot_polling_thread = BotThread(bot)
    bot_polling_thread.start()
    log.info("Bot thread has been started.")

    log.info(f"Starting Flask server on {config.FLASK_HOST}:{config.FLASK_PORT}")
    app.run(host=config.FLASK_HOST, port=config.FLASK_PORT, debug=config.FLASK_DEBUG, use_reloader=False)

