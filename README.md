# 🎥 YouTube Downloader

A minimalist and extremely easy-to-use YouTube downloader for Windows, written in Python. It supports downloading videos (MP4) and converting them into audio files (MP3).

---

## ✨ Features

- **Video Download (MP4):** Downloads the video in the best available quality up to a maximum of 1080p.
- **Audio Extraction (MP3):** Downloads the audio track only and automatically converts it to an MP3 file (192 kbps).
- **Automatic Setup:** Simply double-click `run.bat` to automatically set up the virtual environment, install dependencies, and launch the downloader.
- **Output Folder:** All downloads are cleanly stored in a local `downloads/` directory.

---

## 🛠️ Prerequisites

### 1. Python 3
This script requires **Python 3**. If you don't have it installed, download it from [python.org](https://www.python.org/).
> [!IMPORTANT]
> During installation, make sure to check the box that says **"Add Python to PATH"**.

### 2. FFmpeg (Required for MP3 Downloads)
To convert downloaded audio files into the MP3 format, you must have **FFmpeg** installed.
- **Windows Installation via Winget:** Open Command Prompt (CMD) or PowerShell and run:
  ```powershell
  winget install Gyan.FFmpeg
  ```
- **Manual Installation:** Download FFmpeg from [ffmpeg.org](https://ffmpeg.org/download.html), extract it, and add the `bin` folder to your Windows system environment variables (PATH).

---

## 🚀 Quick Start (Windows)

The project includes a convenient startup script that automatically creates a Python virtual environment (`.venv`) and installs the required libraries (such as `yt-dlp`):

1. Download this repository as a ZIP file (or clone it using `git clone`).
2. Double-click the **`run.bat`** file.
3. Follow the prompts in the console.

---

## 💻 Manual Installation (Alternative)

If you prefer to set up and run the script manually in your command prompt or on non-Windows platforms:

1. Create and activate a virtual environment:
   ```bash
   python -m venv .venv
   # Windows:
   .venv\Scripts\activate
   # macOS/Linux:
   source .venv/bin/activate
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the script:
   ```bash
   python youtube_downloader.py
   ```

---

## 📁 Project Structure

```text
ytdownloader/
├── .gitignore              # Prevents temporary files and downloads from being pushed to GitHub
├── README.md               # This documentation
├── requirements.txt        # Python library dependencies (yt-dlp, etc.)
├── run.bat                 # Windows automatic setup & runner script
├── youtube_downloader.py   # Main Python script
└── downloads/              # Directory where downloaded files are saved
```

---

## ❓ Troubleshooting

- **Error: `FFmpegExtractAudio` / "ffmpeg not found":**  
  Ensure FFmpeg is installed and properly added to your system's PATH. If you just installed it, make sure to restart your Command Prompt or `run.bat` to apply the changes.
- **Download fails on certain videos:**  
  YouTube frequently updates its platform, which can sometimes break video extraction. If downloads start failing, update the packages in your virtual environment by running:
  ```bash
  .venv\Scripts\pip install --upgrade yt-dlp
  ```
