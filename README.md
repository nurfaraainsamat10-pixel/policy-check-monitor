# Policy Check Monitor

**Get it:** download `Policy Check Monitor.html` from this repository (and `Set up daily check.ps1` if you want it to open every morning), keep both in one folder, and open the HTML file in Microsoft Edge or Google Chrome. Nothing to install.

> Never add customer policy PDFs, briefings or logs to this repository; they contain personal data. `.gitignore` blocks the usual file types.

## How to run it

**What it does:** reads every new motor insurance policy PDF in one folder and highlights what a workshop claims desk needs. It then writes a briefing automatically. You don't need to click anything to approve it, and nothing is ever sent to anyone.

## Claim essentials (highlighted at the top of every policy)
Each item shows as a coloured tile: 🔴 red = problem for the claim, 🟡 amber = check by hand, 🟢 green = good, 🔵 blue = details to note.

| Tile | Why it matters at the workshop |
|---|---|
| **Cover type** | Comprehensive allows an own-damage repair claim. Third-party cover doesn't. |
| **Period of cover** | The accident date must fall inside it. The tile turns red if the pages disagree or the policy has expired. |
| **Betterment** | Shows whether it's waived. If it isn't, the tile works out roughly what share of new-parts cost the customer pays, based on the car's age (standard scale: 5 yrs 15% up to 10+ yrs 40%). |
| **Excess customer pays** | Stated excess plus any voluntary excess. |
| **Sum insured** | The most the insurer pays, and the reference for total-loss cases. |
| **Windscreen** | The windscreen limit. A windscreen-only claim doesn't affect NCD. |
| **Flood / special perils** | Whether flood, storm or landslide damage is claimable. |
| **NCD** | An own-damage claim normally resets it, so tell the customer. |
| **Authorised drivers** | Whether the driver at the time of the accident is allowed to drive. |
| **Vehicle to verify** | Registration, model, year, engine and chassis numbers to match against the car. |
| **Use of vehicle** | Hire or e-hailing use isn't covered unless the policy has been endorsed for it. |
| **Financier** | Who gets paid in a total loss. |
| **Insurer · policy** | Policy, endorsement and agent numbers for the claim form. |

Below the tiles, **Full checklist** shows every check with the exact wording found in the PDF.

## One-time setup
1. Make a folder for incoming policies, e.g. `Documents\Policy Inbox`.
2. Open **Policy Check Monitor.html** in **Microsoft Edge or Google Chrome**.
3. Click **Connect Policy Inbox folder**, pick the folder, and click **Allow**.
4. Optional: in **Settings**, type your name or department so it appears on briefings.

## Daily use
1. **Save new policy PDFs into the Policy Inbox folder.**
2. **Open the app.** It checks the folder automatically and again every 30 minutes while open. Files it has already checked are skipped. If a yellow bar appears, click **Check inbox now** and **Allow**.
3. **Read the results.** The claim essentials are at the top. Each new check also writes a briefing to `Policy Inbox\Briefings\` automatically.
4. **Share it if needed** with *Print / Save as PDF* or *Download briefing*.

**Want it to open by itself each morning?** Right-click **Set up daily check.ps1** and choose *Run with PowerShell*. It opens the app at 9:00 AM on weekdays.

## When things go wrong
| You see | Meaning | What to do |
|---|---|---|
| "Unreadable pages" | That page is an image, so its text can't be read | Look at that page yourself |
| "Could not be checked automatically" | Scanned, password-protected, damaged, or not a motor policy | Check that document by hand |
| "Not found" on a tile | The detail isn't in the documents | Check the PDF or ask the insurer |
| Banner: "PDF reader could not load" | No internet connection | Reconnect and reload |

**Run log:** shown at the bottom of the app and saved to `Policy Inbox\policy-monitor-log.csv`.

## Good to know
- **Briefings aren't reviewed by a person**, and each one says so. Check red tiles against the PDF before you tell a customer they aren't covered.
- **Betterment percentages are estimates** from the standard scale. The insurer's adjuster has the final say.
- **The app never contacts the insurer, agent or customer.** You do that yourself.
