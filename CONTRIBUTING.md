# Contributing to AWESOME-Azure-Bicep

Welcome — thank you for considering a contribution! This guide explains the easiest ways to add content, fix issues, or improve structure. We want this repo to be friendly to beginners and to encourage the community to share useful Azure Bicep resources.

If you’re new to GitHub, don’t worry — the steps below are written to be easy to follow. If anything is unclear, open an issue and we’ll help.

---

## Quick start (for busy contributors)

1. Fork the repository (top-right of the repo page).
2. Create a branch in your fork:
   - Example: `add/john-doe-bicep-snippet` or `fix/typo-readme`
3. Edit README.md to add or update a resource (see "How to add a link" below).
4. Commit your change with a clear message.
5. Push the branch and open a Pull Request (PR) to this repo's `main` branch.
6. Link your PR to a short description of why it helps; maintainers will review.

---

## What we accept

We accept links and resources about Azure Bicep that fit these criteria:

- Directly related to Azure Bicep (language, tooling, templates, learning).
- Freely accessible (no paywall).
- Clearly attributed (author or source).
- Either Official (Microsoft) or Community (non-Microsoft) content.
- No duplicates — check the existing lists before adding.

---

## Contribution standards (formatting & ordering)

Follow these simple rules so lists stay clean and useful:

- One link per bullet.
- Use sentence case for titles (e.g., "How to use modules in Bicep").
- GitHub repository names should be lower-case (e.g., `my-bicep-samples`).
- Sort items alphabetically within each section.
- Prefer a short descriptive title and then the link. Example:
  - Learn Bicep samples and posts — https://github.com/ElYusubov/Learn-Bicep
- Keep external links to accessible resources (public docs, blogs, videos, repos).

---

## How to add a link (detailed)

1. Open README.md in your fork and find the appropriate section (Official / Community).
2. If a suitable sub-section exists, add your item there. If not, you can propose a new sub-section (see below).
3. Add a single bullet text in the format
4. Put the new item in alphabetical order with similar entries.
5. Commit and create a PR.

Example patch (Markdown line to add):
```markdown
- Bicep Modules Quickstart — https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/modules (examples and notes)
```

---

## Adding a new category or sub-section

If your resource doesn't fit an existing category:

1. Propose a new sub-section name in your PR description (why it belongs and a short list of initial items).
2. Add the new sub-section to README.md with 1–3 example links.
3. Explain in the PR description how it differs from existing sections.
4. The maintainers will review naming and placement, and may adjust wording before merging.

---

## Pull Request checklist

When submitting a PR, please:

- Use a descriptive title: `Add: Bicep X tutorial by Y` or `Fix: typo in README`.
- Explain what you changed and why in the PR description.
- Ensure there are no duplicate links already in the README.
- Run a quick preview to make sure Markdown renders correctly.
- Keep changes limited to the README (or CONTRIBUTING.md) unless you have a reason to change other files.

Suggested branch naming:
- add/<your-github>-<short-topic>
- fix/<short-description>

Suggested commit message:
- Add: "<Short title>" — <link or short note>

---

## What happens after you open a PR

- A maintainer will review the PR for clarity, duplication, and formatting.
- Expect a response within about 5-7 business days. If you don't hear back, politely ping the maintainers by commenting on the PR.
- We may adjust the item for grammar, consistent styling, or placement.
- When merged, your contribution is live — thank you!

---

## Creating issues

Please open an issue if:

- You find a broken link or outdated resource.
- You have a suggestion for a new section or a repo restructure.
- You are unsure where to add your link or want maintainers to add it for you.

Issue template (free-form):
- Title: short summary (e.g., "Broken link: Bicep Modules Quickstart")
- Body: link, location (README section), suggested fix.

---

## Be welcoming and inclusive

We welcome contributors of all experience levels. If you’re new to Git/GitHub or need help making a small change, say so in an issue — we can assist or make the change for you.

If this repository has a CODE OF CONDUCT, please follow it. If not, please be respectful, patient, and constructive in all interactions.

---

## Examples & templates

Example PR description:
- What: Add "Bicep Modules Quickstart" to Community → Repositories
- Why: Provides clear module examples for beginners
- Where: Community → Repositories
- Link: https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/modules

If you prefer, paste your suggested line in an issue and ask a maintainer to add it for you.

---

## Encouraging the community

Want to contribute more than links?
- Share short tutorials, sample repos, templates, or videos.
- Add “good first issue” or starter sample PRs to help beginners learn Bicep and GitHub.
- Tell us about meetups, podcasts, or courses that are free and relevant.

If you want to be a regular contributor or help curate, mention it in an issue — we can discuss maintainer/curator roles.

---

## License & attribution

By contributing, you agree that your contributions will be included under this repository’s license. If your contribution copies content from elsewhere, ensure you have permission and include clear attribution.

---

## FAQ

Q: I’m new to GitHub — can I still contribute?
A: Absolutely. Open an issue with what you'd like to add and we can help or make the change for you.

Q: Where should I put videos or podcasts?
A: Use Community → Videos or Community → Podcasts. If you’re unsure, open an issue.

Q: How do you decide what to merge?
A: We prioritize accuracy, usefulness, accessibility, and relevance to Azure Bicep.

---

Thanks again for helping build a useful, beginner-friendly collection of Azure Bicep resources. We look forward to your contributions!