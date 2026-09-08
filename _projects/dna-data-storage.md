---
layout: page
title: DNA data storage
description: writing and reading digital data in DNA on a single electrochemical device
img: assets/img/proj_dna_data_storage.jpg
importance: 2
category: work
related_publications: true
---

DNA is an appealing medium for archival storage. It is dense, it lasts, and it
copies itself. What holds it back is the apparatus: writing a file and reading it
back normally means two separate instruments and a lot of manual transfer in
between.

My doctoral work approached that gap from the hardware side. We built a system
that both synthesizes and sequences DNA electrochemically on one gold electrode,
so a file can be written and read without leaving the device
{% cite xu2021electrochemical %}. Because synthesizing every strand from scratch
is wasteful, we then treated pre-made DNA blocks as movable type and assembled
them into new messages instead {% cite xu2023assembly %}.

We also stepped back to ask what actually limits the reliability of such a
pipeline, and surveyed where errors enter a synthetic-DNA storage system end to
end {% cite xu2021uncertainties %}.

Work from the same group scaled the electrode array and tested alternative
substrates for on-chip synthesis {% cite feng2026renewable gao2025transformable feng2024gel %}.
