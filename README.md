# MTSD-S Speech Subset

A publicly accessible, de-identified subset of the **MTSD-S** (Multimodal Sub-Threshold Depression Speech) dataset, released to support reproducible research on speech-based subthreshold depression detection.

## Contents

| Folder   | Description                          | Valence                |
|----------|--------------------------------------|------------------------|
| `image/` | Picture-description speech recordings | negative / neutral / positive |
| `word/`  | Word-reading speech recordings        | negative / neutral / positive |
| `text/`  | Text-reading speech recordings        | single session         |

## File naming convention

Files are named as `<participant>_<task>_<valence>.wav`, e.g.:

- `001_image_negative.wav` — participant 001, picture-description task, negative-valenced stimulus
- `004_words_neutral.wav`  — participant 004, word-reading task, neutral stimulus
- `002_text.wav`           — participant 002, text-reading task

## Participants

This subset contains the picture-description (`image/`), word-reading (`word/`), and text-reading (`text/`) recordings of the **8 participants** in the MTSD-S cohort — 4 with subthreshold depression (IDs 002, 003, 012, 104) and 4 healthy controls (IDs 001, 004, 005, 006). All participants provided **written informed consent** for the sharing of their de-identified recordings. Interview recordings are **not** included in this public subset and are available on request. See the associated publication for details on the cohort, the recording protocol, and the ethics approval.

## Access

- **Public subset**: this repository. DOI: https://doi.org/10.5281/zenodo.22248906
- **Full dataset** (including interview recordings that may contain sensitive personal information): available upon request from the corresponding author (E-mail: fzugym@gmail.com) for **non-commercial academic research** only, subject to ethics review and a signed data-use agreement. See the associated publication for the access procedure.

## License

The speech recordings in this repository are licensed under [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/).

- Commercial use / redistribution is **not** permitted.
- Re-identification of participants is **prohibited**.
- When using the data, please cite the associated publication.

## Citation

If you use this dataset, please cite:

> [Full citation of the paper + dataset DOI]


