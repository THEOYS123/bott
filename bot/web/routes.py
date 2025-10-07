from flask import Blueprint, render_template, request, flash, redirect, url_for
from modules.osint_analyzer import analyze_phone_number
import config

web_bp = Blueprint('web', __name__, template_folder='../templates')

@web_bp.route('/')
def dashboard():
    return render_template("dashboard.html", title="Dashboard", active="dashboard")

@web_bp.route('/osint', methods=['GET', 'POST'])
def osint_form():
    if request.method == 'POST':
        phone = request.form.get('phone')
        if not phone:
            flash("Nomor telepon tidak boleh kosong.", "danger")
            return redirect(url_for('web.osint_form'))
        
        result_dict = analyze_phone_number(phone)
        return render_template("result.html", title="OSINT Result", result=result_dict, active="osint")
    
    return render_template("osint_form.html", title="OSINT Analysis", active="osint")

@web_bp.route('/settings', methods=['GET', 'POST'])
def settings():
    if request.method == 'POST':
        new_token = request.form.get('token')
        if new_token and new_token != config.get_bot_token():
            config.save_bot_token(new_token)
            flash("Token Bot berhasil diperbarui! Harap restart server agar perubahan diterapkan.", "success")
        else:
            flash("Token tidak valid atau sama dengan yang sekarang.", "warning")
        return redirect(url_for('web.settings'))

    current_token = config.get_bot_token()
    return render_template("settings.html", title="Settings", active="settings", current_token=current_token)

@web_bp.route('/about')
def about():
    return render_template("about.html", title="About", active="about")

