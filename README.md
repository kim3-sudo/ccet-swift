# CCET - Apple Swift

Cyclist's Cognitive Evaluation Tool, a WIP native app for rapid concussion testing

After crashing, cyclists are all too eager to hop back on their bike without being evaluated for a concussion, even if there's a possibility that their head might have experienced a traumatic event. For obvious reasons, this behavior is quite dangerous, and in amateur cycling, the dangers are amplified by the very fact that cycling is very much an individual sport - there's no sports medicine staff readily available and trailing behind on every training ride to evaluate concussions like those in the pro peloton get.

This is a preliminary, work-in-progress, fledgling, side-project app as I learn how to use Swift for native iOS (and by proxy, macOS) app development to solve a problem that I haven't found a good solution for. Sure, concussion testing apps exist, but they don't really function well for long-term cognitive tracking, marking distinct events (like crashes), or setting new baselines at different activity levels - adrenaline makes the brain behave differently than when at rest. The test modes planned are as follows.

- Dry-run: scores are not recorded, but a test is run to demonstrate how the app works.
- Baseline at rest: while the user is resting and calm, a test is run to establish a resting baseline score; a routine test.
- Baseline after activity: after the user has engaged in heavy physical activity, a test is run to establish an active baseline score; a routine test.
- Trauma evaluation: after a crash, a user evaluates their cognitive performance and compares against baselines to determine if they may need to stop their ride and seek help; abnormal test.

As of writing (and time of this commit), there are three tests planned to establish cognitive levels pre- and post-event.

1. Reaction time
2. Short-term memory recall - reading
3. Physical material control

Scores are compared against the user's own baseline, not anyone else's. The tasks are intended to be very simple, intended to offer a very snapshot view of the user's cognitive level.

This app and its data are not intended to and cannot replace the expertise of a medical professional. If you suspect that you may have suffered a concussion, you should always seek medical help and have a proper examination to determine whether damage from some traumautic brain event has occurred.
