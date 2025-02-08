# Dart Alfred API for Last.fm Scraping

## Overview
This is a **Dart Alfred-based API** that scrapes music-related information from **Last.fm** and returns the data as **JSON**. The API provides various endpoints to fetch search results, artist details, album details, track details, tag-based information, lyrics, upcoming events, and even extract YouTube streaming info for tracks.

## Features
- Search for music-related content on **Last.fm**.
- Retrieve details about **artists, albums, tracks, and tags**.
- Fetch **paginated** results for tag-based searches.
- Extract **lyrics** for tracks.
- Fetch **upcoming events** for an artist.
- Extract **audio streaming information** from YouTube.

## API Endpoints

### **General**
- `GET /api/v1/` - Home route of the API. Returns a funny welcome message.

### **Search**
- `GET /api/v1/search/<query>` - Fetches search results from Last.fm.

### **Details Fetching**
- `POST /api/v1/details/artist` - Fetches artist details from Last.fm.
  - **Body:** `{ "url": "https://www.last.fm/music/Lil%2520Wayne" }`
- `POST /api/v1/details/album` - Fetches album details from Last.fm.
  - **Body:** `{ "url": "https://www.last.fm/music/Lil%27+Wayne/Tha+Carter+V" }`
- `POST /api/v1/details/track` - Fetches track/song details from Last.fm.
  - **Body:** `{ "url": "https://www.last.fm/music/Drake/_/FAMILY+MATTERS" }`
- `POST /api/v1/details/tag` - Fetches tag/category details from Last.fm.
  - **Body:** `{ "url": "https://www.last.fm/tag/jazz+rap" }`

### **Tag-Based Data Fetching (Paginated)**
- `POST /api/v1/tag/artists` - Fetches artists associated with a tag.
  - **Body:** `{ "url": "https://www.last.fm/tag/jazz+rap/artists", "page": 2 }`
- `POST /api/v1/tag/albums` - Fetches albums associated with a tag.
  - **Body:** `{ "url": "https://www.last.fm/tag/jazz+rap/albums", "page": 2 }`
- `POST /api/v1/tag/tracks` - Fetches tracks associated with a tag.
  - **Body:** `{ "url": "https://www.last.fm/tag/jazz+rap/tracks", "page": 2 }`

### **Lyrics and Events**
- `POST /api/v1/lyrics` - Fetches lyrics of a song.
  - **Body:** `{ "url": "https://www.last.fm/music/Drake/_/FAMILY+MATTERS/+lyrics" }`
- `POST /api/v1/events` - Fetches upcoming events for an artist.
  - **Body:** `{ "url": "https://www.last.fm/music/Lil%27+Wayne/+events" }`

### **YouTube Audio Extraction**
- `POST /api/v1/extractor` - Fetches the audio streaming info of a track's YouTube video.
  - **Body:** `{ "url": "https://www.youtube.com/watch?v=REkh2BD1UYE" }`

## Tech Stack
- **Dart** (Backend)
- **Alfred** (Express.js-like API framework for Dart)
- **Web Scraping** (Custom scrapers for extracting data from Last.fm)

## Deployment & Usage
To run the API locally:
```sh
# Install dependencies
dart pub get

# Run the server
dart run
```

## Project Status
🚨 **This project is actively maintained, but contributions are welcome!** 🚨

## License
MIT License. See `LICENSE` for details.

