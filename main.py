import json
from google.cloud import firestore

def handler(request):
    headers = {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET,OPTIONS",
        "Access-Control-Allow-Headers": "Content-Type",
    }

    if request.method == "OPTIONS":
        return ("", 204, headers)

    try:
        name = request.args.get("name", "World")

        # ✅ AUTO-DETECT PROJECT (FIX)
        db = firestore.Client()

        doc_ref = db.collection("greetings").document(name)
        doc = doc_ref.get()

        count = doc.to_dict().get("count", 0) + 1 if doc.exists else 1
        doc_ref.set({"count": count})

        return (
            json.dumps({
                "message": f"Hello, {name}!",
                "count": count
            }),
            200,
            headers
        )

    except Exception as e:
        return (
            json.dumps({"error": str(e)}),
            200,
            headers
        )
