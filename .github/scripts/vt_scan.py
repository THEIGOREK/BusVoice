#!/usr/bin/env python3
"""Отправляет файлы обновления в VirusTotal и обновляет страницу docs/VIRUSTOTAL.md."""
import hashlib, json, os, sys, time, uuid, datetime, urllib.request, urllib.error

KEY = os.environ.get("VT_API_KEY", "").strip()
API = "https://www.virustotal.com/api/v3"
FILES = ["update.zip", "BusVoice_Installer.exe"]
HIST = "docs/virustotal/history.json"
PAGE = "docs/VIRUSTOTAL.md"


def sha256(p):
    h = hashlib.sha256()
    with open(p, "rb") as f:
        for b in iter(lambda: f.read(1 << 20), b""):
            h.update(b)
    return h.hexdigest()


def req(method, url, data=None, headers=None):
    h = {"x-apikey": KEY, "accept": "application/json"}
    h.update(headers or {})
    r = urllib.request.Request(url, data=data, headers=h, method=method)
    with urllib.request.urlopen(r, timeout=120) as resp:
        return json.loads(resp.read().decode())


def upload(path):
    size = os.path.getsize(path)
    url = API + "/files"
    if size > 32 * 1024 * 1024:
        url = req("GET", API + "/files/upload_url")["data"]
    b = uuid.uuid4().hex
    body = (f"--{b}\r\nContent-Disposition: form-data; name=\"file\"; filename=\"{os.path.basename(path)}\"\r\n"
            "Content-Type: application/octet-stream\r\n\r\n").encode() + open(path, "rb").read() + f"\r\n--{b}--\r\n".encode()
    return req("POST", url, body, {"content-type": "multipart/form-data; boundary=" + b})["data"]["id"]


def wait(aid):
    for _ in range(60):
        a = req("GET", API + "/analyses/" + aid)["data"]["attributes"]
        if a.get("status") == "completed":
            return a["stats"]
        time.sleep(20)
    raise SystemExit("VirusTotal не завершил проверку вовремя")


def main():
    if not KEY:
        sys.exit("Не задан секрет VT_API_KEY (Settings → Secrets and variables → Actions)")
    ver = json.load(open("update.json", encoding="utf-8"))["version"]
    hist = json.load(open(HIST, encoding="utf-8")) if os.path.exists(HIST) else []
    now = datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M UTC")
    for fn in FILES:
        if not os.path.exists(fn):
            continue
        sh = sha256(fn)
        if any(e["sha256"] == sh and e.get("done") for e in hist):
            continue
        print("Проверяю", fn, sh)
        st = wait(upload(fn))
        mal, sus = st.get("malicious", 0), st.get("suspicious", 0)
        total = sum(st.get(k, 0) for k in ("malicious", "suspicious", "undetected", "harmless"))
        hist = [e for e in hist if not (e["version"] == ver and e["file"] == fn)]
        hist.append({"version": ver, "file": fn, "sha256": sh, "malicious": mal, "suspicious": sus,
                     "total": total, "date": now, "done": True})
        print(fn, "→", mal, "вредоносных,", sus, "подозрительных из", total)
    json.dump(hist, open(HIST, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    render(hist)


def vkey(v):
    return tuple(int(x) if x.isdigit() else 0 for x in v.split("."))


def render(hist):
    rows = sorted(hist, key=lambda e: (vkey(e["version"]), e["file"]), reverse=True)
    out = ["# 🛡 Проверка на вирусы (VirusTotal)", "",
           "Каждая версия BusVoice — и файл обновления, и установщик — автоматически отправляется на [VirusTotal](https://www.virustotal.com) "
           "(70+ антивирусных движков) прямо из GitHub Actions, без участия автора. Нажмите на версию, чтобы открыть отчёт VirusTotal "
           "и сверить хеш SHA-256 со своим файлом.", "",
           "| Версия | Файл | Результат | Проверено | SHA-256 |", "|---|---|---|---|---|"]
    for e in rows:
        link = "https://www.virustotal.com/gui/file/" + e["sha256"]
        res = "✅ чисто" if e["malicious"] == 0 and e["suspicious"] == 0 else f"⚠️ {e['malicious']} + {e['suspicious']}"
        out.append(f"| [**{e['version']}**]({link}) | `{e['file']}` | {res} ({e['malicious']}/{e['total']}) | {e['date']} | `{e['sha256'][:16]}…` |")
    out += ["", "## Как проверить самому", "",
            "1. Скачайте файл и посчитайте хеш: `certutil -hashfile BusVoice_Installer.exe SHA256` (Windows PowerShell: `Get-FileHash`).",
            "2. Откройте ссылку нужной версии в таблице — хеш на странице VirusTotal должен совпасть.",
            "3. Исходный код проверки — [`.github/scripts/vt_scan.py`](../.github/scripts/vt_scan.py), запуск — [`virustotal.yml`](../.github/workflows/virustotal.yml).", "",
            "> Единичные срабатывания малоизвестных антивирусов на упакованные программы (в том числе на Python-приложения) бывают ложными. "
            "Если вы видите срабатывание — напишите в Issues, разберёмся.", ""]
    open(PAGE, "w", encoding="utf-8").write("\n".join(out))


if __name__ == "__main__":
    main()
