# TYH Storyboard Rebuild

Static rebuild of the Judoboards Little Barditchevers storyboard app.

## Run

```sh
python3 -m http.server 4173
```

Then open `http://localhost:4173/`.

## Notes

- Scene data saves to browser `localStorage`.
- Import/export uses JSON, including custom field and list settings.
- The Setup tab controls card sections, acts, locations, statuses, and cameras; each list can be reordered by dragging its handle.
- Setup also controls the media viewer ratio and row card height.
- The side panel opens and hides from the left-edge tab; its Agent tab can update cards, add scenes, and propagate fields across acts, locations, statuses, or scenes.
- The Agent tab runs local commands by default, and can optionally call either OpenAI's Responses API or Anthropic's Messages API with session-only API keys.
- The Music tab stores song file info, editable master lyrics, ElevenLabs transcription, and one-click lyric distribution across timed or selected scenes.
- Card checkboxes mark intended cards for Agent/Music actions; selected cards can be mass-deleted from the top selection bar.
- Scene cards use a consistent fixed size with an internal scroll area and pinned footer.
- Each act is a horizontal row: additional cards and the compact add-scene plus button continue to the right instead of wrapping.
- The board has Cards and Story views; Story gives a vertical act-grouped outline with first thumbnails, key info, selection checkboxes, overview stats, and drag reordering.
- The Animatic view adds a video-style preview, main and extra audio track lanes, and scene timing slots grouped by act; editing slot timings updates the shared card/story timecodes.
- Animatic shows a thumbnail stack beneath the preview with inclusion checkboxes; checked media appears as clips inside the matching time bracket in the timeline.
- Animatic includes play, pause, stop, replay, loop, zoom, draggable clips, edge trimming within each scene bracket, and browser video export with MP4 when supported or WebM fallback.
- Camera assignment uses a multi-select dropdown.
- Uploaded card media shows a compact thumbnail strip under the main image/video for quick switching.
- Scene timecodes keep a simple reset/stop button on the left and a live seconds readout on the right; clicking the timecode itself plays or pauses that section.
- Media and audio are local previews. Small images can persist in `localStorage`; large files and videos are session-only previews.
- The rebuild intentionally does not write to the live Firebase or Cloudinary services from the original public page.
