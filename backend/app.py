from flask import Flask, request

app = Flask(__name__)

@app.route("/submit", methods=["POST"])
def submit():
    # Try form first, then JSON as a fallback
    name = request.form.get("name")
    if not name:
        data = request.get_json(silent=True) or {}
        name = data.get("name")
    return f"Hello {name}, Flask received your data!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
