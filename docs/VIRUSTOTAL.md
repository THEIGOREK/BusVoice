# 🛡 Проверка на вирусы (VirusTotal)

Каждая версия BusVoice — и файл обновления, и установщик — автоматически отправляется на [VirusTotal](https://www.virustotal.com) (70+ антивирусных движков) прямо из GitHub Actions, без участия автора. Нажмите на версию, чтобы открыть отчёт VirusTotal и сверить хеш SHA-256 со своим файлом.

| Версия | Файл | Результат | Проверено | SHA-256 |
|---|---|---|---|---|
| [**1.31.2**](https://www.virustotal.com/gui/file/317233e3568c266de73edf01fb066bc0b9310209ef00b68a989b62dfa0173049) | `update.zip` | ✅ чисто (0/64) | 2026-11-06 09:18 UTC | `317233e3568c266d…` |
| [**1.31.1**](https://www.virustotal.com/gui/file/3493dc8f89ffb4e336c5c15923039f28930bfa1c50a2cf7ba396c5b315de873a) | `update.zip` | ✅ чисто (0/65) | 2026-11-06 09:15 UTC | `3493dc8f89ffb4e3…` |
| [**1.31.0**](https://www.virustotal.com/gui/file/e8622860ab9e44774148d63644bab7e88415240f764b9cbcfbd243c88a125094) | `update.zip` | ✅ чисто (0/65) | 2026-11-06 04:54 UTC | `e8622860ab9e4477…` |
| [**1.30.2**](https://www.virustotal.com/gui/file/a7b6f009cb6ada51aef7ad257467a08e926fbf9de2c9e09d550537d8d5b98d17) | `update.zip` | ✅ чисто (0/65) | 2026-11-06 04:44 UTC | `a7b6f009cb6ada51…` |
| [**1.30.1**](https://www.virustotal.com/gui/file/480653c32c8bc499726fbf88b68f8ee1dc2fbd3fcec251daaab0d10e8ece7e31) | `update.zip` | ✅ чисто (0/61) | 2026-11-06 04:38 UTC | `480653c32c8bc499…` |
| [**1.30.0**](https://www.virustotal.com/gui/file/12138d35082b0a6872b5226bdae03ecff1ba6c88afd8ccceb56f18e829a42fb9) | `update.zip` | ✅ чисто (0/56) | 2026-11-06 04:22 UTC | `12138d35082b0a68…` |
| [**1.29.1**](https://www.virustotal.com/gui/file/0f66f893ad20460269c9d9ccf6325f97b889a74fa6086bdbe937ddf73847efda) | `update.zip` | ✅ чисто (0/65) | 2026-11-05 09:45 UTC | `0f66f893ad204602…` |
| [**1.29.1**](https://www.virustotal.com/gui/file/05c318995187b128d18d77ea7e78a9dc1263506f1432ad3b2313fedcd5cf1d76) | `BusVoice_Installer.exe` | ⚠️ 5 + 0 (5/71) | 2026-11-05 09:45 UTC | `05c318995187b128…` |

## Как проверить самому

1. Скачайте файл и посчитайте хеш: `certutil -hashfile BusVoice_Installer.exe SHA256` (Windows PowerShell: `Get-FileHash`).
2. Откройте ссылку нужной версии в таблице — хеш на странице VirusTotal должен совпасть.
3. Исходный код проверки — [`.github/scripts/vt_scan.py`](../.github/scripts/vt_scan.py), запуск — [`virustotal.yml`](../.github/workflows/virustotal.yml).

> Единичные срабатывания малоизвестных антивирусов на упакованные программы (в том числе на Python-приложения) бывают ложными. Если вы видите срабатывание — напишите в Issues, разберёмся.
