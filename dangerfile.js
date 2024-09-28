// danger.js

import { danger, fail, markdown } from "danger";

// Get the pull request body
const prBody = danger.github.pr.body;

// Check if the required checkbox is checked
const checkboxRegex = /\* \[x\] I have read and agreed to the contributing guidelines\./i;

if (!checkboxRegex.test(prBody)) {
  fail("Please check the 'I have read and agreed to the contributing guidelines.' checkbox in the PR description.");
  markdown(
    "🔔 Make sure to check the checkbox to indicate you've read and agreed to the contributing guidelines before submitting your PR. This ensures that all contributors are aware of the standards expected."
  );
}
