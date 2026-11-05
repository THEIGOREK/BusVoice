# 🛡 Проверка на вирусы (VirusTotal)

Каждая версия BusVoice — и файл обновления, и установщик — автоматически отправляется на [VirusTotal](https://www.virustotal.com) (70+ антивирусных движков) прямо из GitHub Actions, без участия автора. Нажмите на версию, чтобы открыть отчёт VirusTotal и сверить хеш SHA-256 со своим файлом.

| Версия | Файл | Результат | Проверено | SHA-256 |
|---|---|---|---|---|
| [**1.29.1**](https://www.virustotal.com/gui/file/0f66f893ad20460269c9d9ccf6325f97b889a74fa6086bdbe937ddf73847efda) | `update.zip` | ⏳ ожидает проверки | ожидает первой проверки | `0f66f893ad204602…` |
| [**1.29.1**](https://www.virustotal.com/gui/file/05c318995187b128d18d77ea7e78a9dc1263506f1432ad3b2313fedcd5cf1d76) | `BusVoice_Installer.exe` | ⏳ ожидает проверки | ожидает первой проверки | `05c318995187b128…` |

## Как проверить самому

1. Скачайте файл и посчитайте хеш: `certutil -hashfile BusVoice_Installer.exe SHA256` (Windows PowerShell: `Get-FileHash`).
2. Откройте ссылку нужной версии в таблице — хеш на странице VirusTotal должен совпасть.
3. Исходный код проверки — [`.github/scripts/vt_scan.py`](../.github/scripts/vt_scan.py), запуск — [`virustotal.yml`](../.github/workflows/virustotal.yml).

> Единичные срабатывания малоизвестных антивирусов на упакованные программы (в том числе на Python-приложения) бывают ложными. Если вы видите срабатывание — напишите в Issues, разберёмся.
