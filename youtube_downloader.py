# python
import sys
import os
from yt_dlp import YoutubeDL

def main():
    while True:
        url = input("🔗 Enter your youtube link: ").strip()
        if not url:
            print("No link entered.")
            sys.exit(1)

        print("Choose format: 1 = Video (MP4), 2 = Audio (MP3)")
        choice = input("Your choice (1/2): ").strip()
        while choice not in ("1", "2"):
            choice = input("Please enter 1 or 2: ").strip()

        os.makedirs("downloads", exist_ok=True)

        if choice == "1":
            ydl_opts = {
                "format": (
                    "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/"
                    "best[height<=1080][ext=mp4]/best[height<=1080]/best"
                ),
                "outtmpl": "downloads/%(title)s.%(ext)s",
                "merge_output_format": "mp4",
                "concurrent_fragment_downloads": 4,
                "noprogress": False,
                "noplaylist": True,
            }
            expected_ext = "mp4"
        else:
            ydl_opts = {
                "format": "bestaudio/best",
                "outtmpl": "downloads/%(title)s.%(ext)s",
                "postprocessors": [
                    {
                        "key": "FFmpegExtractAudio",
                        "preferredcodec": "mp3",
                        "preferredquality": "192",
                    }
                ],
                "concurrent_fragment_downloads": 4,
                "noprogress": False,
                "noplaylist": True,
            }
            expected_ext = "mp3"

        try:
            with YoutubeDL(ydl_opts) as ydl:
                info = ydl.extract_info(url, download=True)
                title = info.get("title") or "video"
                print(f"\n✅ Finish! File: downloads/{title}.{expected_ext}")
        except Exception as e:
            print("❌ Download failed.")
            print("Common causes:")
            print("- Video is privat/age restricted/bought/DRM/geo-locked")
            print("- ffmpeg is missing in PATH")
            print("- Network/Proxy is blocking request")
            print(f"Technical Message: {e}")
            sys.exit(1)

if __name__ == "__main__":
    main()
 